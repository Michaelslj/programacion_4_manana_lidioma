fun main() {
    val nombreProducto = "Mouse"
    val categoria = "Periféricos"
    val stock = 28

    // Variable simple
    println("Producto: $nombreProducto")

    // Expresión
    println("Producto completo: ${nombreProducto.uppercase()} - ${categoria.uppercase()}")

    val descripcion = "Producto completo: ${nombreProducto.uppercase()} - ${categoria.uppercase()}"
    println(descripcion)

    println("Stock después de venta: ${stock - 6} unidades")

    // String multilinea (tipo reporte o ficha del producto)
    val fichaProducto = """
        |Nombre: $nombreProducto
        |Categoría: $categoria
        |Stock: $stock
        |Estado: ${if (stock > 0) "Disponible" else "Agotado"}
    """.trimMargin()

    println(fichaProducto)
}