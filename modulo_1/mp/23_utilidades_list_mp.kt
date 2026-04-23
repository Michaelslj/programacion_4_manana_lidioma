fun main() {

    println("=== UTILIDADES DE LISTAS EN INVENTARIO ===")

    val precios = listOf(100.0, 250.0, 80.0, 60.0, 300.0)
    println("Precios: $precios")

    // MAP (transformar datos)
    val preciosConIVA = precios.map { it * 1.12 }
    println("Precios con IVA: $preciosConIVA")

    val etiquetas = precios.map { "Producto $$it" }
    println("Etiquetas: $etiquetas")

    println("=== FILTER (filtrar datos) ===")

    val baratos = precios.filter { it < 100 }
    println("Productos baratos: $baratos")

    val caros = precios.filter { it > 200 }
    println("Productos caros: $caros")

    val rangoMedio = precios.filter { it in 80.0..200.0 }
    println("Rango medio: $rangoMedio")

    val noBaratos = precios.filterNot { it < 100 }
    println("No baratos: $noBaratos")

    val mezcla = listOf("Laptop", 100, "Celular", 200, true)
    val soloTexto = mezcla.filterIsInstance<String>()
    println("Solo nombres: $soloTexto")

    println("=== REDUCE ===")

    val total = precios.reduce { acc, p -> acc + p }
    println("Total inventario: $total")

    val maxPrecio = precios.reduce { acc, p -> if (p > acc) p else acc }
    println("Precio máximo: $maxPrecio")

    println("=== FOLD ===")

    val totalConBase = precios.fold(100.0) { acc, p -> acc + p }
    println("Total con base inicial: $totalConBase")

    println("=== ORDENACIÓN ===")

    println("Ascendente: ${precios.sorted()}")
    println("Descendente: ${precios.sortedDescending()}")

    println("=== AGREGACIÓN ===")

    println("Suma: ${precios.sum()}")
    println("Promedio: ${precios.average()}")
    println("Mínimo: ${precios.minOrNull()}")
    println("Máximo: ${precios.maxOrNull()}")
    println("Cantidad > 100: ${precios.count { it > 100 }}")

    println("=== BÚSQUEDA ===")

    println("Primer > 100: ${precios.find { it > 100 }}")
    println("Último > 100: ${precios.findLast { it > 100 }}")
    println("¿Hay > 200?: ${precios.any { it > 200 }}")
    println("¿Todos > 50?: ${precios.all { it > 50 }}")
    println("¿Ninguno > 500?: ${precios.none { it > 500 }}")

    /**
     * Utilidades avanzadas en listas para inventario
     * @param precios Lista de precios de productos
     * @return Permite transformar, filtrar, ordenar y analizar datos
     */
}