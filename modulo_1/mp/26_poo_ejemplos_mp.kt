// Constructor primario con propiedades integradas
class Producto(
    val nombre: String,
    val precio: Double
)

// Clase con cuerpo adicional
class ProductoInventario(
    val nombre: String,
    val stock: Int
) {

    // Método para mostrar información
    fun mostrarInfo(): String {
        return "Producto: $nombre | Stock: $stock unidades"
    }

    // Método para verificar disponibilidad
    fun disponible(): Boolean {
        return stock > 0
    }
}

fun main() {

    val producto = Producto(
        "Laptop Gamer",
        1200.0
    )

    println(producto.nombre)
    println(producto.precio)

    val producto2 = ProductoInventario(
        "Mouse Inalámbrico",
        15
    )

    println(producto2.mostrarInfo())

    println(producto2.disponible())
}