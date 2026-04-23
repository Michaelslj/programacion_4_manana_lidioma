fun main() {

    println("=== LISTAS EN INVENTARIO ===")

    val productos = listOf("Laptop", "Celular", "Tablet", "Celular", "Audífonos")

    println("Cantidad de productos: ${productos.size}")
    println("Primer producto: ${productos[0]}")
    println("Primer elemento: ${productos.first()}")
    println("Último elemento: ${productos.last()}")

    println("Elemento en índice 2: ${productos.get(2)}")
    println("Índice de 'Celular': ${productos.indexOf("Celular")}")
    println("¿Existe 'Tablet'?: ${productos.contains("Tablet")}")
    println("¿Existe 'Celular'?: ${"Celular" in productos}")

    // Sublistas
    println("Sublista: ${productos.subList(1, 3)}")
    println("Primeros 2 productos: ${productos.take(2)}")
    println("Eliminar primeros 3: ${productos.drop(3)}")
    println("Últimos 2 productos: ${productos.takeLast(2)}")

    println("Recorrido de productos:")
    for (producto in productos) {
        println(producto)
    }

    println("=== LISTAS MUTABLES ===")

    val categorias = mutableListOf("Electrónica", "Accesorios", "Hogar", "Oficina")
    println(categorias)

    categorias.add("Gaming")
    println(categorias)

    categorias.add(0, "Tecnología")
    println(categorias)

    categorias.remove("Gaming")
    println(categorias)

    categorias[1] = "Móviles"
    println(categorias)

    println("=== ARRAY DEQUE (COLA DE PRODUCTOS) ===")

    val colaProductos = ArrayDeque<String>()
    println(colaProductos)

    colaProductos.addFirst("Laptop")
    println(colaProductos)

    colaProductos.addLast("Celular")
    println(colaProductos)

    colaProductos.addLast("Tablet")
    println(colaProductos)

    colaProductos.removeFirst()
    println(colaProductos)

    colaProductos.removeLast()
    println(colaProductos)


}