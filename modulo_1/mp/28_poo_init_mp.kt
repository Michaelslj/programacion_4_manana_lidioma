class Producto(val nombre: String, val categoria: String) {
    val nombreNormalizado: String
    val categoriaMayuscula: String
    init {
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(categoria.isNotBlank()) { "La categoría no puede estar vacía" }
        nombreNormalizado = nombre.trim().lowercase()
        categoriaMayuscula = categoria.uppercase()
    }
}
fun main() {

    val p = Producto("  Laptop Gamer  ", "electronica")

    println(p.nombreNormalizado)   // laptop gamer
    println(p.categoriaMayuscula)  // ELECTRONICA
}