// La interfaz define QUÉ puede hacer
interface GestionProducto {

    fun procesar(cantidad: Int): Boolean

    val nombre: String
}

class EntradaStock(
    val producto: String
) : GestionProducto {

    override val nombre = "Entrada de stock"

    override fun procesar(cantidad: Int): Boolean {

        println(
            "📦 Ingresando $cantidad unidades de $producto"
        )

        return true
    }
}

class SalidaStock(
    val producto: String
) : GestionProducto {

    override val nombre = "Salida de stock"

    override fun procesar(cantidad: Int): Boolean {

        println(
            "🛒 Retirando $cantidad unidades de $producto"
        )

        return true
    }
}

class Devolucion(
    val producto: String
) : GestionProducto {

    override val nombre = "Devolución"

    override fun procesar(cantidad: Int): Boolean {

        println(
            "↩️ Devolviendo $cantidad unidades de $producto"
        )

        return true
    }
}

// POLIMORFISMO
fun gestionar(
    cantidad: Int,
    operacion: GestionProducto
) {

    println(
        "Procesando ${operacion.nombre}..."
    )

    val exito =
        operacion.procesar(cantidad)

    println(
        if (exito)
            "✅ Operación exitosa"
        else
            "❌ Error"
    )
}

fun main() {

    val operaciones: List<GestionProducto> =
        listOf(

            EntradaStock("Laptop Gamer"),

            SalidaStock("Mouse RGB"),

            Devolucion("Teclado Mecánico")
        )

    operaciones.forEach {

        gestionar(5, it)
    }
}