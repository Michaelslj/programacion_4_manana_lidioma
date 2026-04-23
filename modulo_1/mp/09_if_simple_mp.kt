fun main() {

    println("=== CONTROLES DE FLUJO EN INVENTARIO ===")

    println("Ingrese la cantidad de stock:")
    val stock = readLine()?.toIntOrNull() ?: 0

    // Condiciones con if
    if (stock <= 5) {
        println("Stock bajo: realizar pedido urgente")
    }

    if (stock <= 2) {
        println("Stock crítico: reabastecer inmediatamente")
    }

    println("Stock registrado: $stock unidades")

}