class Libro(
    val id: Int,
    val titulo: String,
    val autor: String
) {
    var disponible = true
}
class Biblioteca {
    private val libros = mutableListOf<Libro>()
    fun agregar(libro: Libro) {
        libros.add(libro)
    }
    fun mostrar() {
        for (l in libros) {
            println("${l.id} - ${l.titulo} - ${l.autor} - ${if (l.disponible) "Disponible" else "Prestado"}")
        }
    }
    fun prestar(id: Int) {
        val libro = libros.find { it.id == id }

        if (libro != null && libro.disponible) {
            libro.disponible = false
            println("Libro prestado")
        } else {
            println("No se puede prestar")
        }
    }
    fun devolver(id: Int) {
        val libro = libros.find { it.id == id }

        if (libro != null && !libro.disponible) {
            libro.disponible = true
            println("Libro devuelto")
        } else {
            println("No se puede devolver")
        }
    }
}
fun main() {
    val b = Biblioteca()
    b.agregar(Libro(1, "El Principito", "Saint-Exupéry"))
    b.agregar(Libro(2, "1984", "Orwell"))
    b.mostrar()
    b.prestar(1)
    b.prestar(1) 
    b.devolver(1)
    b.mostrar()
}