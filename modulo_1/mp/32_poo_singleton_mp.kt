object InventarioConfig {

    val empresa: String = "TechStore"
    val sucursal: String = "Quito"

    private val codigoInterno: String = "INV-2026"

    fun informacion() = "$empresa - $sucursal"

    fun acceso() = mapOf(
        "codigo" to codigoInterno
    )
}
class Producto private constructor(
    val id: Int,
    val nombre: String
) {
    companion object {

        private var contadorId = 0

        // Factory function
        fun crear(nombre: String, categoria: String): Producto? {

            if (nombre.isBlank() || categoria.isBlank()) {
                return null
            }

            return Producto(
                ++contadorId,
                nombre.trim()
            )
        }

        const val CATEGORIA_DEFECTO = "General"
    }
}
fun main() {

    println(InventarioConfig.informacion())

    // InventarioConfig.codigoInterno // ERROR — privado

    val producto = Producto.crear(
        "Laptop Gamer",
        "Electrónica"
    )
    println(producto)
}