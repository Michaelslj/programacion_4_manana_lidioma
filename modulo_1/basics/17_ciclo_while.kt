fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetititvos-Ciclo While")
    println("While Basico")
    var contador = 1
    while(contador <= 5){
        println(contador)
        contador ++;
    }
    
    println("Do While")
    contador = 1
    do{
        println(contador)
        contador ++;
    } while(contador <=5)
    
    println("Break continue")
    contador = 1
    while(contador <= 10){
        contador ++;
        if(contador==3) continue
        if(contador==7) break
        println(contador)
    }
    
    var input: String
    while(true){
        println("Escribe 'salir' para terminar")
        input = readLine()?:""
        if(input=="salir") break
        println("usted ingreso: $input")
    }
}