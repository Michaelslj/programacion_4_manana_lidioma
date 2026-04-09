fun main() {
    println("Controles de flujo when")
    println("Escriba código")
    
    val codig= readLine()?.toIntOrNull()?:0
    val especialidad = when(codigo){
        1->"Medicina general"
        2->"Pediatria"
        3->"Cardiologia"
        4->"Ginecologia"
        5->"Neurologia"
        6->"Dermatologia"
        else ->"Especialidad no registrada en el sistema"
    }
    println("Especialidad: $especialidad")
}