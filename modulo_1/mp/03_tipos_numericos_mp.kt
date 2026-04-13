fun main() {
    // Tipos de datos aplicados a inventario

    // Cantidades (enteros)
    val stockMinimo: Byte = 10
    println("Stock mínimo permitido: $stockMinimo")

    val stockActual: Short = 32000
    println("Stock actual en bodega: $stockActual")

    val totalProductos: Int = 12122122
    println("Total de productos registrados: $totalProductos")

    val codigoBarras: Long = 12122122122123
    println("Código de barras: $codigoBarras")

    println("Precios y valores decimales")

    val precioCompra: Float = 3.14f
    println("Precio de compra: $precioCompra")

    val precioVenta: Double = 3.14159265
    println("Precio de venta: $precioVenta")

    // Inferencia de tipos (datos del producto)
    val nombreProducto = "Teclado"
    val cantidad = 56

    println("Producto: $nombreProducto")
    println("Tipo inferido nombre: ${nombreProducto::class.simpleName}")

    println("Cantidad disponible: $cantidad")
    println("Tipo inferido cantidad: ${cantidad::class.simpleName}")
}