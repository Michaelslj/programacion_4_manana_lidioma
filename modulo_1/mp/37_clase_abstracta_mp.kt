abstract class Producto(val nombre: String) {

    // abstract — las subclases deben implementar
    abstract val precio: Double

    abstract val stock: Int

    abstract fun descripcion(): String

    // concreto — reutilizable
    fun comparar(otro: Producto): String = when {

        precio > otro.precio ->
            "$nombre es más caro que ${otro.nombre}"

        precio < otro.precio ->
            "$nombre es más barato que ${otro.nombre}"

        else ->
            "$nombre y ${otro.nombre} tienen el mismo precio"
    }

    override fun toString() =
        "${descripcion()} | Precio: $$precio"
}

class Laptop(
    override val precio: Double,
    override val stock: Int
) : Producto("Laptop") {

    override fun descripcion() =
        "Laptop con stock $stock"
}

class Mouse(
    override val precio: Double,
    override val stock: Int
) : Producto("Mouse") {

    override fun descripcion() =
        "Mouse con stock $stock"
}

class Teclado(
    override val precio: Double,
    override val stock: Int
) : Producto("Teclado") {

    override fun descripcion() =
        "Teclado con stock $stock"
}

fun main() {

    // POLIMORFISMO
    val productos: List<Producto> = listOf(

        Laptop(1200.0, 5),

        Mouse(35.0, 10),

        Teclado(80.0, 7)
    )

    productos.forEach {

        println(it)
    }

    val caro = productos.maxByOrNull {

        it.precio
    }

    println(
        "\nProducto más caro: ${caro?.nombre}"
    )

    println(
        productos[0].comparar(productos[1])
    )
}