// El usuario de esta clase solo sabe QUÉ puede hacer con un Producto
// No necesita saber cómo se calcula el descuento ni cómo funciona el stock

class Producto(

    val id: Int,
    val nombre: String,
    val precio: Double,
    private val stock: Int   // privado: no se puede modificar directamente

) {

    // Propiedad calculada automáticamente
    val precioConIVA: Double
        get() = precio * 1.12

    // Verifica si hay disponibilidad
    val disponible: Boolean
        get() = stock > 0

    // Mensaje según cantidad de stock
    val estadoStock: String
        get() = when {
            stock == 0 -> "Sin stock"
            stock <= 5 -> "Stock bajo"
            else -> "Disponible"
        }

    override fun toString(): String {
        return "$nombre - Precio: $${"%.2f".format(precio)}"
    }
}

fun main() {

    val laptop = Producto(
        1,
        "Laptop Gamer",
        1200.0,
        3
    )

}