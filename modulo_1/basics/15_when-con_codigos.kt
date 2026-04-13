fun main() {
    println("Controles de flujo when-con bloque de codigos")
    println("Nombre del paciente")

    val nombrePaciente= readLine()?.trim()?.lowercase()?:"Sin identificacion"
    println("Tiene nivel alerta CRITICO/URGENTE/MODERADO/LEVE")
    val nivel= readLine()?.trim()?.uppercase()?:""
    
    when(nivel){
        "CRITICO"->{
            println("ALERTA CRITICA: Paciente: $nombrePaciente")
            println("Llamar al medico de guarida")
            println("Activar protocolo urgenica critica")
        }
        "URGENTE"->{
            println("ALERTA URGENTE: Paciente: $nombrePaciente")
            println("Priorizar en la sala de espera")
            println("Reevaluar en 15 minutos")
        }
        "MODERADO"->println("MODERADO: Paciente: $nombrePaciente")
        "LEVE"->println("LEVE: Paciente: $nombrePaciente")
        else-> println("Nivel no reconocido")
    }

}