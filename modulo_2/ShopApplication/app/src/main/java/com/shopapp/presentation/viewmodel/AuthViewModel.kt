// presentation/viewmodel/AuthViewModel.kt
package com.shopapp.presentation.viewmodel

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.shopapp.domain.model.LoggedUser
import com.shopapp.domain.repository.AuthRepository
import com.shopapp.presentation.ui.auth.AuthUiState
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AuthViewModel @Inject constructor(
    private val authRepository: AuthRepository,
) : ViewModel() {

    // ── Estado de la UI ───────────────────────────────────────
    private val _uiState = MutableStateFlow<AuthUiState>(AuthUiState.Idle)
    val uiState: StateFlow<AuthUiState> = _uiState.asStateFlow()

    // ── Usuario logueado (Flow reactivo) ──────────────────────
    val currentUser: StateFlow<LoggedUser?> = authRepository.currentUser
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), null)

    val isAuthenticated: StateFlow<Boolean> = currentUser
        .map { it != null }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.Eagerly,
            initialValue = false
        )

    val isStaff: StateFlow<Boolean> = currentUser
        .map { it?.isStaff == true }
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.Eagerly,
            initialValue = false
        )

    // ── Estado de carga inicial ───────────────────────────────
    private val _isCheckingSession = MutableStateFlow(true)
    val isCheckingSession: StateFlow<Boolean> = _isCheckingSession.asStateFlow()

    init {
        // Marcamos como listo una vez que el Flow haya tenido oportunidad de emitir su primer valor
        viewModelScope.launch {
            // No usamos filter { it != null } porque si no hay usuario (null), 
            // la app se quedaría cargando infinitamente.
            currentUser.first()
            _isCheckingSession.value = false
        }
    }

    // ── Login ─────────────────────────────────────────────────
    fun login(username: String, password: String) {
        if (_uiState.value is AuthUiState.Loading) return
        viewModelScope.launch {
            _uiState.value = AuthUiState.Loading
            authRepository.login(username.trim(), password)
                .onSuccess { user ->
                    _uiState.value     = AuthUiState.Success(user)
                }
                .onFailure { e ->
                    _uiState.value = AuthUiState.Error(e.message ?: "Error al iniciar sesión")
                }
        }
    }

    // ── Registro ──────────────────────────────────────────────
    fun register(username: String, email: String, password: String, password2: String) {
        if (_uiState.value is AuthUiState.Loading) return
        viewModelScope.launch {
            _uiState.value = AuthUiState.Loading
            authRepository.register(username.trim(), email.trim(), password, password2)
                .onSuccess { user ->
                    _uiState.value     = AuthUiState.Success(user)
                }
                .onFailure { e ->
                    _uiState.value = AuthUiState.Error(e.message ?: "Error al registrarse")
                }
        }
    }

    // ── Logout ────────────────────────────────────────────────
    fun logout() {
        viewModelScope.launch {
            authRepository.logout()
            _uiState.value     = AuthUiState.Idle
        }
    }

    fun clearError() {
        if (_uiState.value is AuthUiState.Error) {
            _uiState.value = AuthUiState.Idle
        }
    }
}