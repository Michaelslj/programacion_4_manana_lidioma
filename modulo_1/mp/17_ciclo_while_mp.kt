fun main() {

    println("=== CICLOS WHILE EN INVENTARIO ===")

    println("While básico (conteo de productos)")
    var contador = 1
    while (contador <= 5) {
        println("Producto número: $contador")
        contador++
    }

    println("Do While (registro mínimo de productos)")
    contador = 1
    do {
        println("Registro de producto: $contador")
        contador++
    } while (contador <= 5)

    println("While con break y continue")
    contador = 1
    while (contador <= 10) {
        contador++

        if (contador == 3) continue   // saltar producto 3
        if (contador == 7) break      // detener en producto 7

        println("Procesando producto $contador")
    }

    println("=== INGRESO INTERACTIVO DE INVENTARIO ===")

    var input: String

    while (true) {
        println("Ingrese nombre de producto (o 'salir' para terminar):")
        input = readLine() ?: ""

        if (input.lowercase() == "salir") break

        println("Producto registrado: $input")
    }

}