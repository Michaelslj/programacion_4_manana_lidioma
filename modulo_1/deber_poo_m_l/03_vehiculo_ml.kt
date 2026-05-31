open class Vehiculo(
    val marca: String,
    val modelo: String,
    val anio: Int
) {
    open fun mostrar() {
        println("$marca $modelo $anio")
    }
}
class Auto(
    marca: String,
    modelo: String,
    anio: Int,
    val puertas: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrar() {
        println("Auto: $marca $modelo $anio - Puertas: $puertas")
    }
}
class Moto(
    marca: String,
    modelo: String,
    anio: Int,
    val cilindrada: Int
) : Vehiculo(marca, modelo, anio) {
    override fun mostrar() {
        println("Moto: $marca $modelo $anio - $cilindrada cc")
    }
}
fun main() {
    val a = Auto("Toyota", "Corolla", 2020, 4)
    val m = Moto("Yamaha", "R15", 2022, 150)
    a.mostrar()
    m.mostrar()
}