fun main() {

    println("=== CONTROL DE INVENTARIO AVANZADO ===")

    println("¿El producto es prioritario? (s/n)")
    val esPrioritario = readLine()?.trim()?.lowercase() == "s"

    println("Ingrese la cantidad de stock:")
    val stock = readLine()?.toIntOrNull() ?: 0

    if (esPrioritario) {
        println("Producto prioritario")

        if (stock < 5) {
            println("Stock crítico: reabastecer urgentemente")
        } else if (stock > 20) {
            println("Stock alto: considerar reducir pedidos")
        } else {
            println("Stock adecuado")
        }

    } else {
        println("Producto no prioritario")

        if (stock < 5 || stock > 20) {
            println("Stock fuera del rango normal")
        } else {
            println("Stock dentro del rango normal")
        }
    }
}