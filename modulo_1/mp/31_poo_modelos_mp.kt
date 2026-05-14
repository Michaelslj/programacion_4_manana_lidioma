data class Producto(
    val id: Int,
    val nombre: String,
    val stock: Int,
    val categoria: String,
    val disponible: Boolean = true
)

fun main() {

    val p1 = Producto(1, "Laptop Gamer", 10, "Electrónica")
    val p2 = Producto(1, "Laptop Gamer", 10, "Electrónica")
    val p3 = Producto(2, "Mouse Inalámbrico", 5, "Accesorios")

    // toString() automático
    println(p1)

    // equals() por valor
    println(p1 == p2)
    println(p1 == p3)

    // copy()
    val pocoStock = p1.copy(stock = 2)
    val noDisponible = p1.copy(disponible = false)

    println(pocoStock)
    println(noDisponible)

    // Desestructuración
    val (id, nombre, stock) = p1

    println("$id: $nombre - Stock: $stock")

    // En bucles
    listOf(p1, p3).forEach { (id2, nombre2, stock2) ->

        println("[$id2] $nombre2 - Stock: $stock2")
    }
}