class Producto(val precio: Double, val stock: Int) {

    val total: Double get() = precio * stock
    val disponible: Boolean get() = stock > 0

    // Siempre llaman al constructor primario con this(...)
    constructor(precio: Double) : this(precio, 1)

    constructor(precio: Int, stock: Int) :
            this(precio.toDouble(), stock)

    override fun toString() =
        "Producto(precio=$precio, stock=$stock) | total=$total"
}

fun main() {

    val p1 = Producto(100.0, 5)
    val p2 = Producto(50.0)
    val p3 = Producto(80, 3)

    println(p1)
    println(p2)
    println(p3)
}