fun main() {
    println("ESCRIBA CÓDIGO")
    println("Edad del paciente")

    val edadPaciente= readLine()?.toIntOrNull()?:0
    println("Tiene seguro")
    val tieneSeguro= readLine()?.trim()?.lowercase()=="s"
    val nivelSeguro = if(tieneSeguro){
        println("Nivel de seguro (BASICO/INTERMEDIO/PREMIUN")
        readLine()?.trim()?.uppercase()?:""
    } else ""
    val copago = when(nivel){
        !tieneSeguro && edadPaciente <18->0.0
        !tieneSeguro && edad >=65 -> 15.0
        !tieneSeguro->45.0
        nivelSeguro=="BASICO"->20.0
        nivelSeguro=="INTERMEDIO"->10.0
        nivelSeguro=="PREMIUN"->0.0
        else ->30.0
    }
    
    println("Copago: $${"%.2f".format(copago)})

}