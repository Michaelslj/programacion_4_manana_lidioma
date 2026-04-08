fun main() {
    val nombre="Peter"
    val apellido="Parker"
    val edad=28
    //Variable simple 
    println("Hola $nombre")
    //Expresión
    println("Nombre completo: ${nombre.uppercase()} ${apellido.uppercase()}")
    val nombreCompleto = "Nombre completo: ${nombre.uppercase()} ${apellido.uppercase()}"
    println(nombreCompleto)
    println("Edad : ${edad+6} años")
    
    //String Multilinea
    val tarjeta= """
    	|Nombre: $nombre $apellido
        |Edad: $edad
        |Acceso: ${if(edad>=18)"Permitido" else "Denegado"} 
        
       """.trimMargin()
    println(tarjeta)
}