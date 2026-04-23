fun main() {

    println("=== CONTROLES DE FLUJO EN INVENTARIO ===")

    println("¿El producto tiene descuento? (s/n)")
    val tieneDescuento = readLine()?.trim()?.lowercase() == "s"

    println("Ingrese el precio base del producto:")
    val precioBase = readLine()?.toDoubleOrNull() ?: 0.0

    if (tieneDescuento) {
        val descuento = precioBase * 0.20
        val precioFinal = precioBase - descuento
        println("Descuento aplicado: $${"%.2f".format(descuento)}")
        println("Precio final: $${"%.2f".format(precioFinal)}")
    } else {
        println("Precio sin descuento: $${"%.2f".format(precioBase)}")
    }

}