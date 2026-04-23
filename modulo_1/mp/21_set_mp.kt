fun main() {

    println("=== SET EN INVENTARIO ===")

    // Set elimina duplicados automáticamente
    val productos = setOf("Laptop", "Celular", "Tablet", "Celular", "Laptop")
    println("Productos únicos: $productos")

    println("=== OPERACIONES DE CONJUNTOS ===")

    val electronicos = setOf("Laptop", "Celular", "Tablet", "Smartwatch")
    val enOferta = setOf("Celular", "Tablet", "Audífonos")

    println("Productos electrónicos: $electronicos")
    println("Productos en oferta: $enOferta")

    println("Unión: ${electronicos union enOferta}")

    println("Intersección: ${electronicos intersect enOferta}")

    println("Diferencia: ${electronicos subtract enOferta}")

    println("=== SET MUTABLE ===")

    val categorias = mutableSetOf("Electrónica", "Hogar", "Oficina")
    println(categorias)

    categorias.add("Electrónica")
    println(categorias)

    categorias.add("Gaming")
    println(categorias)

    categorias.remove("Hogar")
    println(categorias)

    println("¿Existe 'Electrónica'?: ${"Electrónica" in categorias}")
    println("¿Existe 'Hogar'?: ${"Hogar" in categorias}")

}