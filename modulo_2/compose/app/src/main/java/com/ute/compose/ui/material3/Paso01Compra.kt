package com.ute.compose.ui.material3


import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ShoppingCart
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun ProductoScreen() {

    var nombreProducto by remember { mutableStateOf("") }
    var cantidad by remember { mutableStateOf("") }
    var precioUnitario by remember { mutableStateOf("") }

    var subtotal by remember { mutableStateOf(0.0) }
    var descuento by remember { mutableStateOf(0.0) }
    var total by remember { mutableStateOf(0.0) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {

        Text(
            text = "Cálculo de Compra",
            style = MaterialTheme.typography.titleLarge
        )

        // Nombre del producto
        OutlinedTextField(
            value = nombreProducto,
            onValueChange = { nombreProducto = it },
            label = { Text("Nombre del Producto") },
            leadingIcon = {
                Icon(
                    Icons.Default.ShoppingCart,
                    contentDescription = null
                )
            },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Next
            ),
            modifier = Modifier.fillMaxWidth()
        )

        // Cantidad
        OutlinedTextField(
            value = cantidad,
            onValueChange = { cantidad = it },
            label = { Text("Cantidad") },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Number,
                imeAction = ImeAction.Next
            ),
            modifier = Modifier.fillMaxWidth()
        )

        // Precio Unitario
        OutlinedTextField(
            value = precioUnitario,
            onValueChange = { precioUnitario = it },
            label = { Text("Precio Unitario") },
            keyboardOptions = KeyboardOptions(
                keyboardType = KeyboardType.Decimal,
                imeAction = ImeAction.Done
            ),
            modifier = Modifier.fillMaxWidth()
        )

        // Botón calcular
        Button(
            onClick = {

                val cantidadInt = cantidad.toIntOrNull() ?: 0
                val precioDouble = precioUnitario.toDoubleOrNull() ?: 0.0

                subtotal = cantidadInt * precioDouble

                descuento = when {
                    subtotal > 50 -> subtotal * 0.10
                    subtotal >= 20 && subtotal <= 50 -> subtotal * 0.05
                    else -> 0.0
                }

                total = subtotal - descuento
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Calcular")
        }

        // Resultados
        Text(text = "Producto: $nombreProducto")
        Text(text = "Subtotal: $subtotal")
        Text(text = "Descuento: $descuento")
        Text(text = "Total a pagar: $total")
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewProductoScreen() {
    MaterialTheme {
        ProductoScreen()
    }
}

