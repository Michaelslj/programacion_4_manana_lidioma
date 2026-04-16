fun main() {
    println("Funciones")
    val saludo = saludo()
    println("$saludo")
    val suma: Int = sumar(5,4)
    println(suma)
    print("${restarTipoExpresion(5,3)}")
    print(restarTipoExpresion(5,3))
    print(restarTipoInferi(5,3))
    saludar("Pedro")
}

fun saludo(): String{
    return "Hello"
}

fun sumar(a: Int,b: Int):Int{
    return a+b
}

//tipo expresion
fun restarTipoExpresion(a: Int,b:Int): Int=a-b
//inferido
fun restarTipoInferido(a: Int,b:Int)=a-b

fun saludar(nombre: String){
    println("Hola $nombre")
}