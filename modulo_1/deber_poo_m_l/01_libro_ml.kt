class libro (
    val titulo: String,
    val autor: String,
    val anioPublicacion: Int,
    val numeroPaginas: Int
) {
    fun mostrarInformacion(){
        println("Titulo: $titulo")
        println("Autor: $autor")
        println("Año de publicacion: $anioPublicacion")
        println("Numero de paginas: $numeroPaginas")
    }

    fun verificarAntiguedad(){
        if (anioPublicacion  < 2000){
            println("El libor es muy antiguo")
        }
        else{
            println("El libro es actual")
        }
    }
}
fun main(){

    val libro1 = libro(
        "Cien años de soledad",
        "Gabriel Garcia Marquez",
        1967,
        471
    )

    val libro2 = libro(
        "Harry Potter y la piedra filosofal",
        "J.K Rowling",
        2001,
        320,
    )
    libro1.mostrarInformacion()
    libro1.verificarAntiguedad()
    libro2.mostrarInformacion()
    libro2.verificarAntiguedad()

}



