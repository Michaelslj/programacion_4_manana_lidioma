package com.ute.compose.ui

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import com.ute.contactos.model.Contacto
import com.ute.contactos.model.contactosDeMuestra

data class DestinoNav(
    val ruta: String,
    val etiqueta: String,
    val iconoActivo: ImageVector,
    val iconoInactivo: ImageVector
)

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun Paso06_DialogosScreen() {

    var contactos by remember { mutableStateOf(contactosDeMuestra) }
    var busqueda by remember { mutableStateOf("") }
    var filtro by remember { mutableStateOf("Todos") }
    var destinoActual by remember { mutableStateOf("contactos") }

    var mostrarNuevo by remember { mutableStateOf(false) }
    var contactoAEliminar by remember { mutableStateOf<Contacto?>(null) }

    var mensajeSnack by remember { mutableStateOf<String?>(null) }

    val snackbarHostState = remember { SnackbarHostState() }

    LaunchedEffect(mensajeSnack) {
        mensajeSnack?.let {
            snackbarHostState.showSnackbar(it)
            mensajeSnack = null
        }
    }

    val contactosFiltrados = contactos
        .filter { c ->
            if (filtro == "Favoritos") c.favorito else true
        }
        .filter { c ->
            busqueda.isBlank() ||
                    c.nombre.contains(busqueda, ignoreCase = true)
        }

    val destinos = listOf(
        DestinoNav(
            "contactos",
            "Contactos",
            Icons.Filled.People,
            Icons.Outlined.People
        ),
        DestinoNav(
            "favoritos",
            "Favoritos",
            Icons.Filled.Favorite,
            Icons.Outlined.FavoriteBorder
        ),
        DestinoNav(
            "perfil",
            "Perfil",
            Icons.Filled.AccountCircle,
            Icons.Outlined.AccountCircle
        )
    )

    Scaffold(

        topBar = {
            TopAppBar(
                title = {
                    Text(
                        "Agenda (${contactos.size})",
                        fontWeight = FontWeight.Bold
                    )
                },
                actions = {
                    IconButton(
                        onClick = {
                            filtro =
                                if (filtro == "Favoritos")
                                    "Todos"
                                else
                                    "Favoritos"
                        }
                    ) {
                        Icon(
                            imageVector =
                                if (filtro == "Favoritos")
                                    Icons.Default.Favorite
                                else
                                    Icons.Default.FavoriteBorder,
                            contentDescription = null
                        )
                    }
                }
            )
        },

        bottomBar = {

            NavigationBar {

                destinos.forEach { destino ->

                    val seleccionado =
                        destinoActual == destino.ruta

                    NavigationBarItem(
                        selected = seleccionado,
                        onClick = {
                            destinoActual = destino.ruta
                        },
                        icon = {
                            Icon(
                                imageVector =
                                    if (seleccionado)
                                        destino.iconoActivo
                                    else
                                        destino.iconoInactivo,
                                contentDescription = destino.etiqueta
                            )
                        },
                        label = {
                            Text(destino.etiqueta)
                        }
                    )
                }
            }
        },

        floatingActionButton = {

            if (destinoActual == "contactos") {

                FloatingActionButton(
                    onClick = {
                        mostrarNuevo = true
                    }
                ) {
                    Icon(
                        Icons.Default.PersonAdd,
                        contentDescription = null
                    )
                }
            }
        },

        snackbarHost = {
            SnackbarHost(snackbarHostState)
        }

    ) { paddingValues ->

        when (destinoActual) {

            "contactos" -> {

                ContenidoContactos(
                    contactos = contactosFiltrados,
                    busqueda = busqueda,
                    filtro = filtro,
                    onBusqueda = { busqueda = it },
                    onFiltro = { filtro = it },

                    onFavorito = { id ->
                        contactos = contactos.map { c ->
                            if (c.id == id)
                                c.copy(favorito = !c.favorito)
                            else
                                c
                        }
                    },

                    onLlamar = { nombre ->
                        mensajeSnack = "Llamando a $nombre"
                    },

                    onEliminar = { contacto ->
                        contactoAEliminar = contacto
                    },

                    modifier = Modifier.padding(paddingValues)
                )
            }

            "favoritos" -> {

                PantallaFavoritosContent(
                    favoritos = contactos.filter { it.favorito },
                    modifier = Modifier.padding(paddingValues)
                )
            }

            "perfil" -> {

                PantallaPerfilContent(
                    modifier = Modifier.padding(paddingValues)
                )
            }
        }
    }

    // Dialogo nuevo contacto
    if (mostrarNuevo) {

        DialogNuevoContacto(

            onDismiss = {
                mostrarNuevo = false
            },

            onGuardar = { nuevo ->

                contactos = contactos + nuevo
                mostrarNuevo = false
                mensajeSnack = "${nuevo.nombre} agregado"
            }
        )
    }

    // Dialogo eliminar
    contactoAEliminar?.let { contacto ->

        AlertDialog(

            onDismissRequest = {
                contactoAEliminar = null
            },

            title = {
                Text("Eliminar contacto")
            },

            text = {
                Text("¿Desea eliminar a ${contacto.nombre}?")
            },

            confirmButton = {

                Button(
                    onClick = {

                        contactos =
                            contactos.filter {
                                it.id != contacto.id
                            }

                        contactoAEliminar = null
                    }
                ) {
                    Text("Eliminar")
                }
            },

            dismissButton = {

                OutlinedButton(
                    onClick = {
                        contactoAEliminar = null
                    }
                ) {
                    Text("Cancelar")
                }
            }
        )
    }
}

@Composable
fun ContenidoContactos(
    contactos: List<Contacto>,
    busqueda: String,
    filtro: String,
    onBusqueda: (String) -> Unit,
    onFiltro: (String) -> Unit,
    onFavorito: (Int) -> Unit,
    onLlamar: (String) -> Unit,
    onEliminar: (Contacto) -> Unit,
    modifier: Modifier = Modifier
) {

    Column(
        modifier = modifier.fillMaxSize()
    ) {

        OutlinedTextField(
            value = busqueda,
            onValueChange = onBusqueda,
            placeholder = {
                Text("Buscar contacto")
            },
            leadingIcon = {
                Icon(Icons.Default.Search, null)
            },
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        )

        LazyRow(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            contentPadding = PaddingValues(horizontal = 16.dp)
        ) {

            items(listOf("Todos", "Favoritos")) { opcion ->

                FilterChip(
                    selected = filtro == opcion,
                    onClick = {
                        onFiltro(opcion)
                    },
                    label = {
                        Text(opcion)
                    }
                )
            }
        }

        Spacer(modifier = Modifier.height(8.dp))

        LazyColumn(
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {

            items(contactos) { contacto ->

                TarjetaContactoCompleta(
                    contacto = contacto,
                    onFavorito = {
                        onFavorito(contacto.id)
                    },
                    onLlamar = {
                        onLlamar(contacto.nombre)
                    },
                    onEliminar = {
                        onEliminar(contacto)
                    }
                )
            }
        }
    }
}

@Composable
fun TarjetaContactoCompleta(
    contacto: Contacto,
    onFavorito: () -> Unit,
    onLlamar: () -> Unit,
    onEliminar: () -> Unit
) {

    ElevatedCard(
        modifier = Modifier.fillMaxWidth()
    ) {

        Row(
            modifier = Modifier.padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {

            Box(
                modifier = Modifier
                    .size(52.dp)
                    .clip(CircleShape)
                    .background(
                        MaterialTheme.colorScheme.primaryContainer
                    ),
                contentAlignment = Alignment.Center
            ) {

                Text(
                    text = contacto.nombre.first().toString(),
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
            }

            Spacer(modifier = Modifier.width(12.dp))

            Column(
                modifier = Modifier.weight(1f)
            ) {

                Text(
                    contacto.nombre,
                    fontWeight = FontWeight.Bold
                )

                Text(contacto.email)

                Text(contacto.telefono)
            }

            IconButton(onClick = onFavorito) {

                Icon(
                    if (contacto.favorito)
                        Icons.Default.Favorite
                    else
                        Icons.Default.FavoriteBorder,
                    contentDescription = null
                )
            }

            IconButton(onClick = onLlamar) {

                Icon(
                    Icons.Default.Phone,
                    contentDescription = null
                )
            }

            IconButton(onClick = onEliminar) {

                Icon(
                    Icons.Default.Delete,
                    contentDescription = null
                )
            }
        }
    }
}

@Composable
fun DialogNuevoContacto(
    onDismiss: () -> Unit,
    onGuardar: (Contacto) -> Unit
) {

    var nombre by remember { mutableStateOf("") }
    var email by remember { mutableStateOf("") }
    var telefono by remember { mutableStateOf("") }

    Dialog(
        onDismissRequest = onDismiss
    ) {

        Card {

            Column(
                modifier = Modifier.padding(20.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {

                Text(
                    "Nuevo contacto",
                    style = MaterialTheme.typography.titleLarge
                )

                OutlinedTextField(
                    value = nombre,
                    onValueChange = {
                        nombre = it
                    },
                    label = {
                        Text("Nombre")
                    }
                )

                OutlinedTextField(
                    value = email,
                    onValueChange = {
                        email = it
                    },
                    label = {
                        Text("Email")
                    }
                )

                OutlinedTextField(
                    value = telefono,
                    onValueChange = {
                        telefono = it
                    },
                    label = {
                        Text("Telefono")
                    }
                )

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.End
                ) {

                    TextButton(
                        onClick = onDismiss
                    ) {
                        Text("Cancelar")
                    }

                    Spacer(modifier = Modifier.width(8.dp))

                    Button(
                        onClick = {

                            onGuardar(
                                Contacto(
                                    id = System.currentTimeMillis().toInt(),
                                    nombre = nombre,
                                    email = email,
                                    telefono = telefono
                                )
                            )
                        }
                    ) {
                        Text("Guardar")
                    }
                }
            }
        }
    }
}

@Composable
fun PantallaFavoritosContent(
    favoritos: List<Contacto>,
    modifier: Modifier = Modifier
) {

    Box(
        modifier = modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {

        Text(
            "Favoritos: ${favoritos.size}"
        )
    }
}

@Composable
fun PantallaPerfilContent(
    modifier: Modifier = Modifier
) {

    Box(
        modifier = modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {

        Text("Pantalla Perfil")
    }
}

@Preview(showBackground = true)
@Composable
fun Paso06_Preview() {

    MaterialTheme {
        Paso06_DialogosScreen()
    }
}