fun main() {
println("TControles de flujo")
val sistolica = readLine()?.toIntOrNull()?:0

val clasificacion = if(sistolica<=90){
    "Hipotension"
} else if(sistolica<=119) {
    "Normal"
}else if(sistolica<=129){
    "Elevada"
} else if(sistolica<=139){
    "Hipertension grado 1"
}else if(sistolica<=179){
    "Hipertension grado 2"
}else {
    "Crisis Hipertensiva"
}
println("Clasificacion: $clasificacion")
}
