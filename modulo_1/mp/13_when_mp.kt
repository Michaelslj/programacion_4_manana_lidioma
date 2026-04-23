fun main() {

    println("=== CONTROL DE PRODUCTOS POR CÓDIGO ===")
    println("Ingrese el código del producto:")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val producto = when (codigo) {
        1 -> "Laptop"
        2 -> "Celular"
        3 -> "Tablet"
        4 -> "Audífonos"
        5 -> "Smartwatch"
        6 -> "Cargador"
        else -> "Producto no registrado en el sistema"
    }

    println("Producto: $producto")


}