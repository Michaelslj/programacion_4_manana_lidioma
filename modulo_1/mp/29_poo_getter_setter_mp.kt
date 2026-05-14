class Producto(precio: Double) {

    var precio: Double = precio
        set(value) {
            require(value >= 0) { "El precio no puede ser negativo" }
            field = value
        }

    val precioConIVA: Double
        get() = precio * 1.12

    val descripcion: String
        get() = when {
            precio < 50   -> "Económico"
            precio < 200  -> "Precio medio"
            precio < 500  -> "Costoso"
            else          -> "Premium"
        }
}

fun main() {

    val producto = Producto(120.0)

    println("Precio: $${producto.precio}")
    println("Precio con IVA: $${producto.precioConIVA}")
    println(producto.descripcion)

    producto.precio = 600.0

    println("Nuevo precio: $${producto.precio}")
    println(producto.descripcion)

}