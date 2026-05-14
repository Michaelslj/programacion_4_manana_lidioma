class ProductoInventario(
    nombre: String,
    stockInicial: Int,
    precioInicial: Double
) {

    // Público — cualquiera puede leerlo
    val nombre: String = nombre

    // Privado — solo esta clase puede modificarlo
    private var stock: Int = stockInicial

    // Privado — protegido para evitar cambios externos
    private var precio: Double = precioInicial

    // Internal — visible dentro del mismo módulo
    internal val codigoProducto: String =
        "PROD-${(1000..9999).random()}"

    // Protected — usado por posibles subclases
    protected open fun calcularIVA(): Double = precio * 0.12

    // Método público para agregar stock
    fun agregarStock(cantidad: Int) {

        require(cantidad > 0) {
            "La cantidad debe ser positiva"
        }

        stock += cantidad

        println(
            "Stock agregado: $cantidad | Nuevo stock: $stock"
        )
    }

    // Método público para retirar productos
    fun retirarStock(cantidad: Int): Boolean {

        require(cantidad > 0) {
            "La cantidad debe ser positiva"
        }

        if (cantidad > stock) {
            println("Stock insuficiente")
            return false
        }

        stock -= cantidad

        println(
            "Stock retirado: $cantidad | Stock restante: $stock"
        )

        return true
    }

    // Método para consultar stock
    fun consultarStock(): Int = stock

    // Método para consultar precio con IVA
    fun consultarPrecioConIVA(): String {

        val precioFinal = precio + calcularIVA()

        return "$${"%.2f".format(precioFinal)}"
    }
}

fun main() {

    val laptop = ProductoInventario(
        "Laptop Gamer",
        10,
        1200.0
    )

    laptop.agregarStock(5)

    laptop.retirarStock(3)

    laptop.retirarStock(20)

    println("Producto: ${laptop.nombre}")

    println("Stock actual: ${laptop.consultarStock()}")

    println("Precio con IVA: ${laptop.consultarPrecioConIVA()}")

    // ERROR:
    // laptop.stock = 100
    // No permitido porque stock es private
}