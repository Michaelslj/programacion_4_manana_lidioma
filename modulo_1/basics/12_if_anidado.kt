fun main() {
println("Frecuencia cardiaca")
val tieneAntecedentes = readLine()?.trim()?.lowercase()=="s"

val frecuencia= readLine()?.toIntOrNull()?:0
if(tieneAntecedentes){
    println("Paciente con antecedentes cardiacos")
    if(frecuencia<50){
        println("Bradicardia severa")
    } else if(frecuencia>100){
        println("Taquicardia")
    } else{
        println("Frecuencia normal")
    }
}else {
    println("Paciente sin antecedentes cardiacos")
    if(frecuencia<50 || frecuencia > 100){
        println("Frecuencia furea del rango normal")
    }else{
        println("Frecuencia cardiaca normal")
    }
}
}
  