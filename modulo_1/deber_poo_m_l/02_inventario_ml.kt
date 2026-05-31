class inventario(
    val codigo: String,
    val nombre: String,
    private var precio: Double,
    private var stock: Int
) {
    fun verPrecio() = precio
    fun verStock() = stock
    fun aumentarStock(cantidad: Int) {
        stock += cantidad
    }
    fun disminuirStock(cantidad: Int) {
        if (stock - cantidad >= 0) {
            stock -= cantidad
        } else {
            println("Stock insuficiente")
        }
    }
    fun cambiarPrecio(nuevo: Double) {
        if (nuevo >= 0)
            precio = nuevo
        else
            println("Precio inválido")
    }
}
fun main() {
    val p = inventario("P1", "Mouse", 10.0, 5)
    
    println(p.verPrecio())
    println(p.verStock())
    p.aumentarStock(3)
    p.disminuirStock(2)
    p.cambiarPrecio(12.5)
    println("Nuevo stock: ${p.verStock()}")
}