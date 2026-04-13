fun main() {

    println("=== OPERACIONES EN INVENTARIO ===")

    // Datos de ejemplo del producto
    val cantidadInicial = 10
    val cantidadVendida = 2

    println("Operaciones básicas con stock")

    println("Stock inicial: $cantidadInicial")
    println("Cantidad vendida: $cantidadVendida")

    // Suma (ingreso de nuevos productos)
    println("Ingreso de productos")
    println("$cantidadInicial + $cantidadVendida: ${cantidadInicial + cantidadVendida}")

    // Resta (venta de productos)
    println("Salida de productos (ventas)")
    println("$cantidadInicial - $cantidadVendida: ${cantidadInicial - cantidadVendida}")

    // Multiplicación (valor total por precio unitario)
    val precioUnitario = 5
    println("Valor total del inventario")
    println("$cantidadInicial * $precioUnitario: ${cantidadInicial * precioUnitario}")

    // División (distribución en lotes)
    println("Distribución en lotes")
    println("$cantidadInicial / $cantidadVendida: ${cantidadInicial / cantidadVendida}")

    // Módulo (residuo de productos)
    println("Productos sobrantes")
    println("$cantidadInicial % $cantidadVendida: ${cantidadInicial % cantidadVendida}")

    println("=== OPERADORES DE ASIGNACIÓN ===")

    var stock = 10

    // Entrada de productos
    stock += 5
    println("Stock después de ingreso (+=5): $stock")

    // Venta de productos
    stock -= 3
    println("Stock después de venta (-=3): $stock")

    // Multiplicación (promoción o duplicación)
    stock *= 2
    println("Stock duplicado (*=2): $stock")

    // División (reparto)
    stock /= 2
    println("Stock dividido (/=2): $stock")

    // Módulo
    stock %= 2
    println("Residuo de stock (%=2): $stock")

    println("=== INCREMENTO Y DECREMENTO ===")

    // Incremento (llega 1 producto)
    stock++
    println("Stock incrementado (stock++): $stock")

    // Decremento (sale 1 producto)
    stock--
    println("Stock decrementado (stock--): $stock")

    /**
     * Simulación de operaciones en un sistema de inventario
     * @param cantidadInicial Cantidad inicial de productos
     * @param cantidadVendida Cantidad de productos vendidos
     * @param precioUnitario Precio por unidad
     * @return Muestra cómo afectan las operaciones al stock
     */
}