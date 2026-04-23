fun main() {

    println("=== CÁLCULO DE DESCUENTO EN INVENTARIO ===")

    println("Ingrese la cantidad de productos:")
    val cantidad = readLine()?.toIntOrNull() ?: 0

    println("¿Es cliente frecuente? (s/n)")
    val esFrecuente = readLine()?.trim()?.lowercase() == "s"

    val tipoCliente = if (esFrecuente) {
        println("Tipo de cliente (BASICO / INTERMEDIO / PREMIUM):")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""

    val descuento = when {
        !esFrecuente && cantidad < 5 -> 0.0
        !esFrecuente && cantidad >= 20 -> 15.0
        !esFrecuente -> 5.0
        tipoCliente == "BASICO" -> 10.0
        tipoCliente == "INTERMEDIO" -> 20.0
        tipoCliente == "PREMIUM" -> 30.0
        else -> 0.0
    }

    println("Descuento aplicado: ${"%.2f".format(descuento)}%")


}