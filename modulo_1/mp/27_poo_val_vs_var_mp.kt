class ProductoInmutable(
    val nombre: String,
    val precio: Double
)
class Inventario(
    var stock: Int = 0
) 
    fun agregarStock() {
        stock++
    }
    fun reiniciarStock() {
        stock = 0
    }
}

class ProductoTemporal(codigo: String) {
    val codigoMayuscula = codigo.uppercase()
}
fun main() {
    println("=== PRODUCTO INMUTABLE ===")
    val producto = ProductoInmutable(
        "Laptop Gamer",
        1200.0
    )
    println(producto.nombre)
    println(producto.precio)
    val inventario = Inventario()
    println("Stock inicial: ${inventario.stock}")
    inventario.agregarStock()
    println("Stock después de agregar: ${inventario.stock}")
    inventario.reiniciarStock()
    println("Stock reiniciado: ${inventario.stock}")
    println("=== PRODUCTO TEMPORAL ===")
    val temporal = ProductoTemporal("prod-001")
    println(temporal.codigoMayuscula)
}