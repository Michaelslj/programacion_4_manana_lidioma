class ProductoInventario(val codigo: String, val precioBase: Double) {
    val codigoLimpio: String
    val precioConIva: Double

    init {
        // Validaciones obligatorias al instanciar la clase
        require(codigo.isNotBlank()) { "El código del producto no puede estar vacío" }
        require(precioBase > 0.0) { "El precio base debe ser mayor a cero" }

        // Inicialización de propiedades derivadas
        codigoLimpio = codigo.trim().uppercase()
        precioConIva = precioBase * 1.15
    }
}

fun main() {
    val producto = ProductoInventario("  prod-102  ", 100.0)

    println(producto.codigoLimpio)   // PROD-102
    println(producto.precioConIva)   // 115.0

    // Si intentas desatar un error de validación descommentando esto:
    // val productoInvalido = ProductoInventario("", -5.0) 
}