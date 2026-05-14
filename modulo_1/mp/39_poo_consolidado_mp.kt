// ABSTRACCIÓN
sealed class MovimientoInventario(
    val titulo: String,
    val descripcion: String
) {

    abstract fun mostrar(): String

    data class Entrada(
        val producto: String,
        val cantidad: Int
    ) : MovimientoInventario(
        "Entrada",
        "Ingreso de productos"
    ) {

        override fun mostrar() =
            "📦 Entrada → $producto | Cantidad: $cantidad"
    }

    data class Salida(
        val producto: String,
        val cantidad: Int
    ) : MovimientoInventario(
        "Salida",
        "Salida de productos"
    ) {

        override fun mostrar() =
            "🛒 Salida → $producto | Cantidad: $cantidad"
    }

    data class Devolucion(
        val producto: String,
        val cantidad: Int
    ) : MovimientoInventario(
        "Devolución",
        "Producto devuelto"
    ) {

        override fun mostrar() =
            "↩️ Devolución → $producto | Cantidad: $cantidad"
    }

    object SinMovimiento :
        MovimientoInventario(
            "",
            ""
        ) {

        override fun mostrar() =
            "📭 Sin movimientos"
    }
}

// INTERFAZ
interface ProcesadorMovimiento {

    val nombre: String

    fun procesar(
        movimiento: MovimientoInventario
    ): Boolean
}

// HERENCIA
class ProcesadorEntrada :
    ProcesadorMovimiento {

    override val nombre = "Entrada"

    override fun procesar(
        movimiento: MovimientoInventario
    ): Boolean {

        if (movimiento !is MovimientoInventario.Entrada)
            return false

        println(
            "[ENTRADA] ${movimiento.producto}"
        )

        return true
    }
}

class ProcesadorSalida :
    ProcesadorMovimiento {

    override val nombre = "Salida"

    override fun procesar(
        movimiento: MovimientoInventario
    ): Boolean {

        if (movimiento !is MovimientoInventario.Salida)
            return false

        println(
            "[SALIDA] ${movimiento.producto}"
        )

        return true
    }
}

// ENCAPSULAMIENTO
class InventarioDispatcher(

    private val servicios:
    List<ProcesadorMovimiento>
) {

    fun ejecutar(
        movimiento: MovimientoInventario
    ) {

        println(
            movimiento.mostrar()
        )

        val exito =
            servicios.any {

                it.procesar(movimiento)
            }

        if (!exito) {

            println(
                "⚠️ Sin procesador disponible"
            )
        }

        println()
    }
}

fun main() {

    val dispatcher =
        InventarioDispatcher(

            listOf(
                ProcesadorEntrada(),
                ProcesadorSalida()
            )
        )

    listOf(

        MovimientoInventario.Entrada(
            "Laptop Gamer",
            5
        ),

        MovimientoInventario.Salida(
            "Mouse RGB",
            2
        ),

        MovimientoInventario.Devolucion(
            "Teclado Mecánico",
            1
        ),

        MovimientoInventario.SinMovimiento

    ).forEach {

        dispatcher.ejecutar(it)
    }
}