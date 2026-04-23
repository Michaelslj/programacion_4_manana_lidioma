fun main() {

    println("=== MAP INMUTABLE EN INVENTARIO ===")

    val proveedores = mapOf(
        "Laptop" to "Dell",
        "Celular" to "Samsung",
        "Tablet" to "Apple",
        "Impresora" to "HP"
    )

    println("Proveedor de Laptop: ${proveedores["Laptop"]}")
    println("Proveedor de Monitor: ${proveedores["Monitor"]}")

    println(proveedores.getOrDefault("Laptop", "Desconocido"))
    println(proveedores.getOrDefault("Monitor", "Desconocido"))

    println("Mapa completo: $proveedores")
    println("Productos: ${proveedores.keys}")
    println("Proveedores: ${proveedores.values}")
    println("Entradas: ${proveedores.entries}")

    for ((producto, proveedor) in proveedores) {
        println("$producto - $proveedor")
    }

    println("=== MAP MUTABLE (INVENTARIO) ===")

    val inventario = mutableMapOf(
        "Laptop" to 10,
        "Impresora" to 4,
        "Teclado" to 12,
        "Mouse" to 8
    )

    inventario["Monitor"] = 5
    println(inventario)

    inventario["Laptop"] = 20
    println(inventario)

    inventario.remove("Mouse")
    println(inventario)

    inventario.getOrPut("Proyector") { 15 }
    println(inventario)

    inventario.getOrPut("Teclado") { 15 }
    println(inventario)

}