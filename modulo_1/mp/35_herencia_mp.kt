// Sin open — no se puede heredar
class Producto(val nombre: String)

// class Laptop : Producto("HP") // ERROR

// Con open — permite herencia
open class ProductoBase(
    val nombre: String,
    val precio: Double
) {

    open fun mostrarInfo() =
        println("$nombre - $$precio")

    open fun categoria() =
        "Producto general"

    fun disponible() =
        println("$nombre disponible")
}

// HERENCIA
class Laptop(nombre: String, precio: Double) :
    ProductoBase(nombre, precio) {

    override fun mostrarInfo() {

        super.mostrarInfo()

        println("Laptop para gaming")
    }

    override fun categoria() =
        "${super.categoria()} - Tecnología"
}

class Mouse(
    nombre: String,
    precio: Double,
    val inalambrico: Boolean
) : ProductoBase(nombre, precio) {

    override fun categoria() =
        "${super.categoria()} - ${
            if (inalambrico)
                "Inalámbrico"
            else
                "Cableado"
        }"
}

fun main() {

    val laptop = Laptop(
        "Laptop Gamer",
        1200.0
    )

    laptop.mostrarInfo()

    val mouse = Mouse(
        "Mouse RGB",
        35.0,
        true
    )

    println(mouse.categoria())

    laptop.disponible()
}