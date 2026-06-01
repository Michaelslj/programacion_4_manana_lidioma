package com.shopapp.presentation.ui.admin.dashboard

import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import com.shopapp.domain.model.LoggedUser

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AdminScaffold(
    currentRoute: String,
    user: LoggedUser?,
    title: String,
    onNavClick: (String) -> Unit,
    onStoreClick: () -> Unit,
    onLogout: () -> Unit,
    content: @Composable (PaddingValues) -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(title) },
                actions = {
                    IconButton(onClick = onLogout) {
                        Text("Logout")
                    }
                }
            )
        },
        content = content
    )
}
