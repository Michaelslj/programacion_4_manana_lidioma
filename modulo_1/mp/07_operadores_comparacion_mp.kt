fun main() {

    println("=== OPERADORES DE COMPARACIÓN EN INVENTARIO ===")

    // Datos del inventario
    val stockActual = 10
    val stockMinimo = 2

    println("Stock actual: $stockActual")
    println("Stock mínimo requerido: $stockMinimo")

    // Comparaciones
    println("¿El stock es igual al mínimo?")
    println("$stockActual == $stockMinimo: ${stockActual == stockMinimo}")

    println("¿El stock es diferente al mínimo?")
    println("$stockActual != $stockMinimo: ${stockActual != stockMinimo}")

    println("¿Hay suficiente stock?")
    println("$stockActual > $stockMinimo: ${stockActual > stockMinimo}")

    println("¿El stock es menor al mínimo?")
    println("$stockActual < $stockMinimo: ${stockActual < stockMinimo}")

    println("¿El stock es menor o igual al mínimo?")
    println("$stockActual <= $stockMinimo: ${stockActual <= stockMinimo}")

    println("¿El stock es mayor o igual al mínimo?")
    println("$stockActual >= $stockMinimo: ${stockActual >= stockMinimo}")

}