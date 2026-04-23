fun main() {

    println("=== CICLOS FOR EN INVENTARIO ===")

    println("For con rango (tabla de precios)")
    for (i in 1..10) {
        println("Producto $i - Precio total: ${i * 5}")
    }

    println("For con until")
    for (i in 1 until 5) {
        println("Producto ID: $i")
    }

    println("For con pasos")
    for (i in 1..10 step 2) {
        println("Producto en posición impar: $i")
    }

    println("For descendente")
    for (i in 10 downTo 1) {
        println("Revisión producto ID: $i")
    }

    println("For con listas (productos)")
    val productos = listOf("Laptop", "Celular", "Tablet")
    for (producto in productos) {
        println(producto)
    }

    println("For con índice y valor")
    for ((index, valor) in productos.withIndex()) {
        println("$index -> $valor")
    }

    println("For con break")
    for (i in 1..10) {
        if (i == 5) {
            println("Detener revisión en producto $i")
            break
        }
        println("Revisando producto $i")
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 3) {
            continue
        }
        println("Producto procesado $i")
    }

    println("For con continue y break")
    for (i in 1..10) {
        if (i == 3) continue
        if (i == 7) break
        println("Producto $i")
    }

    println("=== LISTA DE INVENTARIO DETALLADA ===")

    val inventario = listOf(
        Triple("Laptop", 10, 1200.0),
        Triple("Celular", 3, 800.0),
        Triple("Tablet", 1, 400.0)
    )

    for ((posicion, item) in inventario.withIndex()) {
        val (nombre, stock, precio) = item

        val alertaStock = if (stock <= 2) "CRÍTICO" else if (stock <= 5) "BAJO" else "NORMAL"
        val valorTotal = stock * precio

        println("ID $posicion - $nombre - Stock: $stock ($alertaStock) - Precio: $$precio - Total: $$valorTotal")
    }

}