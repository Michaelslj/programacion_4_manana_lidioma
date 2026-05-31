interface MetodoPago {
    fun pagar(monto: Double)
}
class efectivo : MetodoPago {
    override fun pagar(monto: Double) {
        println("Pagado en efectivo: $monto")
    }
}
class Tarjeta : MetodoPago {
    override fun pagar(monto: Double) {
        println("Pagado con tarjeta: $monto")
    }
}
class Transferencia : MetodoPago {
    override fun pagar(monto: Double) {
        println("Transferencia realizada: $monto")
    }
}

fun main() {
    val pagos = listOf(
        efectivo(),
        Tarjeta(),
        Transferencia()
    )
    for (p in pagos) {
        p.pagar(50.0)}
}