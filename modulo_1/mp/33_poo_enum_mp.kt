enum class EstadoProducto(
    val descripcion: String,
    val disponible: Boolean
) {

    DISPONIBLE ("Producto disponible", true),
    AGOTADO    ("Sin stock", false),
    RESERVADO  ("Producto reservado", false),
    VENDIDO    ("Producto vendido", false),
    DEVUELTO   ("Producto devuelto", true);

    fun puedeCambiarA(siguiente: EstadoProducto): Boolean = when (this) {
        DISPONIBLE -> siguiente == RESERVADO || siguiente == VENDIDO
        RESERVADO -> siguiente == VENDIDO || siguiente == DEVUELTO
        else -> false
    }
}

fun main() {

    val estado = EstadoProducto.DISPONIBLE

    println(estado.descripcion)
    println(estado.disponible)

    val icono = when (estado) {

        EstadoProducto.DISPONIBLE -> "✅"
        EstadoProducto.AGOTADO -> "❌"
        EstadoProducto.RESERVADO -> "⏳"
        EstadoProducto.VENDIDO -> "🛒"
        EstadoProducto.DEVUELTO -> "↩️"
    }

    println(icono)

    println(
        estado.puedeCambiarA(
            EstadoProducto.VENDIDO
        )
    )
}