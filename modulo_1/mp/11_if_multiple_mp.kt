fun main() {

    println("=== CLASIFICACIÓN DE STOCK ===")

    println("Ingrese la cantidad de productos:")
    val stock = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (stock <= 2) {
        "Stock crítico"
    } else if (stock <= 5) {
        "Stock bajo"
    } else if (stock <= 10) {
        "Stock normal"
    } else if (stock <= 20) {
        "Stock alto"
    } else {
        "Stock excedente"
    }

    println("Clasificación: $clasificacion")
}
