fun main() {

    println("=== FUNCIONES EN INVENTARIO ===")

    val mensaje = mensajeBienvenida()
    println(mensaje)

    val total = calcularTotal(5, 4)
    println("Total de productos: $total")

    println("Stock restante (expresión): ${restarStockExpresion(10, 3)}")
    println("Stock restante (inferido): ${restarStockInferido(10, 3)}")

    saludarUsuario("Administrador")
}

fun mensajeBienvenida(): String {
    return "Bienvenido al sistema de inventario"
}

fun calcularTotal(a: Int, b: Int): Int {
    return a + b
}

fun restarStockExpresion(a: Int, b: Int): Int = a - b

fun restarStockInferido(a: Int, b: Int) = a - b

fun saludarUsuario(nombre: String) {
    println("Hola $nombre, gestione su inventario")
}