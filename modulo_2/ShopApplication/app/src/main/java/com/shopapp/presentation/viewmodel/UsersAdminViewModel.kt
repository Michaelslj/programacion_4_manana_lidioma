// presentation/viewmodel/UsersAdminViewModel.kt
package com.shopapp.presentation.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.shopapp.domain.model.User
import com.shopapp.domain.model.UserPayload
import com.shopapp.domain.repository.UserRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*
import javax.inject.Inject

enum class UserRoleFilter(val label: String) {
    ALL("Todos"),
    CLIENTS("Clientes"),
    STAFF("Staff"),
    ACTIVE("Activos"),
    INACTIVE("Inactivos"),
}

data class UsersAdminUiState(
    val users:      List<User>     = emptyList(),
    val isLoading:  Boolean        = false,
    val error:      String?        = null,
    val total:      Int            = 0,
    val search:     String         = "",
    val roleFilter: UserRoleFilter = UserRoleFilter.ALL,
)

sealed interface UserFormState {
    data object Idle                       : UserFormState
    data object Saving                     : UserFormState
    data class  Success(val msg: String)   : UserFormState
    data class  Error(val message: String) : UserFormState
}

@HiltViewModel
class UsersAdminViewModel @Inject constructor(
    private val repository: UserRepository,
) : ViewModel() {

    private val _state = MutableStateFlow(UsersAdminUiState())
    val state: StateFlow<UsersAdminUiState> = _state.asStateFlow()

    private val _formState = MutableStateFlow<UserFormState>(UserFormState.Idle)
    val formState: StateFlow<UserFormState> = _formState.asStateFlow()

    // Ya no filtramos localmente, mostramos lo que viene del servidor
    val filtered: StateFlow<List<User>> = _state
        .map { it.users }
        .stateIn(viewModelScope, SharingStarted.Eagerly, emptyList())

    private var searchJob: Job? = null

    init { load() }

    fun load() {
        viewModelScope.launch {
            _state.update { it.copy(isLoading = true, error = null) }
            
            val isStaffParam = when(_state.value.roleFilter) {
                UserRoleFilter.STAFF -> true
                UserRoleFilter.CLIENTS -> false
                else -> null
            }
            
            val isActiveParam = when(_state.value.roleFilter) {
                UserRoleFilter.ACTIVE -> true
                UserRoleFilter.INACTIVE -> false
                else -> null
            }

            repository.getUsers(
                search = _state.value.search.ifBlank { null },
                isStaff = isStaffParam,
                isActive = isActiveParam,
                page = 1 // Por ahora cargamos la primera página de resultados
            )
                .onSuccess { (users, total) ->
                    _state.update { it.copy(users = users, total = total, isLoading = false) }
                }
                .onFailure { e ->
                    _state.update { it.copy(isLoading = false, error = e.message) }
                }
        }
    }

    fun setSearch(query: String) {
        _state.update { it.copy(search = query) }
        searchJob?.cancel()
        searchJob = viewModelScope.launch {
            delay(500) // Esperar a que el usuario termine de escribir
            load()
        }
    }

    fun setRoleFilter(filter: UserRoleFilter) {
        _state.update { it.copy(roleFilter = filter) }
        load()
    }

    fun loadNextPage() {
        if (_state.value.isLoading) return
        
        val currentPage = (_state.value.users.size / 20) + 1 // Asumiendo 20 por página
        
        viewModelScope.launch {
            _state.update { it.copy(isLoading = true) }
            
            val isStaffParam = when(_state.value.roleFilter) {
                UserRoleFilter.STAFF -> true
                UserRoleFilter.CLIENTS -> false
                else -> null
            }
            
            val isActiveParam = when(_state.value.roleFilter) {
                UserRoleFilter.ACTIVE -> true
                UserRoleFilter.INACTIVE -> false
                else -> null
            }

            repository.getUsers(
                search = _state.value.search.ifBlank { null },
                isStaff = isStaffParam,
                isActive = isActiveParam,
                page = currentPage + 1
            ).onSuccess { (newUsers, total) ->
                _state.update { s ->
                    s.copy(
                        users = s.users + newUsers,
                        total = total,
                        isLoading = false
                    )
                }
            }.onFailure { e ->
                _state.update { it.copy(isLoading = false, error = e.message) }
            }
        }
    }

    // Toggle staff — optimista
    fun toggleStaff(id: Int, isStaff: Boolean) {
        _state.update { s ->
            s.copy(users = s.users.map { u ->
                if (u.id == id) u.copy(isStaff = isStaff) else u
            })
        }
        viewModelScope.launch {
            val user = _state.value.users.first { it.id == id }
            repository.updateUser(id, UserPayload(
                username  = user.username,
                email     = user.email,
                firstName = user.firstName,
                lastName  = user.lastName,
                isStaff   = isStaff,
                isActive  = user.isActive,
            )).onFailure {
                // Revertir
                _state.update { s ->
                    s.copy(users = s.users.map { u ->
                        if (u.id == id) u.copy(isStaff = !isStaff) else u
                    })
                }
            }
        }
    }

    // Toggle activo — optimista
    fun toggleActive(id: Int) {
        val user = _state.value.users.find { it.id == id } ?: return
        val next = !user.isActive
        _state.update { s ->
            s.copy(users = s.users.map { u ->
                if (u.id == id) u.copy(isActive = next) else u
            })
        }
        viewModelScope.launch {
            repository.toggleActive(id)
                .onSuccess { serverActive ->
                    _state.update { s ->
                        s.copy(users = s.users.map { u ->
                            if (u.id == id) u.copy(isActive = serverActive) else u
                        })
                    }
                }
                .onFailure {
                    // Revertir
                    _state.update { s ->
                        s.copy(users = s.users.map { u ->
                            if (u.id == id) u.copy(isActive = !next) else u
                        })
                    }
                }
        }
    }

    fun createUser(payload: UserPayload) {
        _formState.value = UserFormState.Saving
        viewModelScope.launch {
            repository.createUser(payload)
                .onSuccess { created ->
                    _state.update { s ->
                        s.copy(users = listOf(created) + s.users, total = s.total + 1)
                    }
                    _formState.value = UserFormState.Success("Usuario creado")
                }
                .onFailure { e ->
                    _formState.value = UserFormState.Error(e.message ?: "Error al crear")
                }
        }
    }

    fun updateUser(id: Int, payload: UserPayload) {
        _formState.value = UserFormState.Saving
        viewModelScope.launch {
            repository.updateUser(id, payload)
                .onSuccess { updated ->
                    _state.update { s ->
                        s.copy(users = s.users.map { if (it.id == id) updated else it })
                    }
                    _formState.value = UserFormState.Success("Usuario actualizado")
                }
                .onFailure { e ->
                    _formState.value = UserFormState.Error(e.message ?: "Error al actualizar")
                }
        }
    }

    fun deleteUser(id: Int) {
        viewModelScope.launch {
            repository.deleteUser(id)
                .onSuccess {
                    _state.update { s ->
                        s.copy(users = s.users.filter { it.id != id }, total = s.total - 1)
                    }
                }
                .onFailure { e ->
                    _state.update { it.copy(error = e.message) }
                }
        }
    }

    fun resetFormState() { _formState.value = UserFormState.Idle }
}