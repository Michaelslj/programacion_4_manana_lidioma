data class Categoria(
    val id: Int,
    val nombre: String
)

data class Producto(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val stock: Int,
    val categoria: Categoria,
    val activo: Boolean = true
) {

    val disponible: Boolean
        get() = activo && stock > 0

    val precioConIVA: Double
        get() = precio * 1.12

    fun aplicarDescuento(porcentaje: Double): Producto {

        require(porcentaje in 0.0..100.0) {
            "Descuento inválido"
        }

        return copy(
            precio = precio * (1 - porcentaje / 100)
        )
    }
}

object CatalogoProductos {

    private val categorias = mutableListOf(

        Categoria(1, "Electrónica"),
        Categoria(2, "Accesorios"),
        Categoria(3, "Gaming")
    )

    private val productos = mutableListOf<Producto>()

    private var siguienteId = 1

    fun agregarProducto(
        nombre: String,
        precio: Double,
        stock: Int,
        categoriaId: Int
    ): Producto? {

        val categoria = categorias.find {
            it.id == categoriaId
        } ?: return null

        val producto = Producto(
            siguienteId++,
            nombre,
            precio,
            stock,
            categoria
        )

        productos.add(producto)
        return producto
    }
    fun listar(): List<Producto> =
        productos.toList()
    fun disponibles(): List<Producto> =
        productos.filter { it.disponible }
    fun porCategoria(id: Int): List<Producto> =
        productos.filter { it.categoria.id == id }
    fun buscar(query: String): List<Producto> =
        productos.filter {
            it.nombre.contains(query, true)
        }
}
fun main() {

    CatalogoProductos.agregarProducto(
        "Laptop Gamer",
        1200.0,
        5,
        1
    )
    CatalogoProductos.agregarProducto(
        "Mouse RGB",
        35.0,
        0,
        2
    )
    CatalogoProductos.agregarProducto(
        "Teclado Mecánico",
        80.0,
        10,
        3
    )
    println("=== Productos ===")
    CatalogoProductos.listar().forEach { p ->

        val estado =
            if (p.disponible) "✅" else "❌"

        println(
            "$estado ${p.nombre} - ${
                "%.2f".format(p.precioConIVA)
            }"
        )
    }
    println("\n=== Productos con descuento ===")
    CatalogoProductos.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach {
            println(
                "${it.nombre}: ${
                    "%.2f".format(it.precio)
                }"
            )
        }
}