fun main() {

    println("=== REGISTRO DE PRODUCTOS CON REPEAT ===")

    println("¿Cuántos productos desea ingresar?")
    val cantidad = readLine()?.toIntOrNull() ?: 0

    var totalValor = 0.0

    repeat(cantidad) { i ->
        println("Producto ${i + 1} - Ingrese precio:")
        val precio = readLine()?.toDoubleOrNull() ?: 0.0

        totalValor += precio
    }

    val promedio = if (cantidad > 0) totalValor / cantidad else 0.0

    println("Precio promedio: $${"%.2f".format(promedio)}")

    println("Clasificación: ${
        when {
            promedio < 50 -> "Productos económicos"
            promedio <= 200 -> "Productos de gama media"
            else -> "Productos costosos"
        }
    }")

}