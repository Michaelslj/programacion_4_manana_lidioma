fun main() {

    println("=== CONTROL DE ALERTAS DE INVENTARIO ===")

    println("Nombre del producto:")
    val nombreProducto = readLine()?.trim() ?: "Sin nombre"

    println("Nivel de alerta (CRITICO / URGENTE / MODERADO / NORMAL):")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {

        "CRITICO" -> {
            println("ALERTA CRÍTICA: Producto: $nombreProducto")
            println("Reabastecer inmediatamente")
            println("Notificar al administrador")
        }

        "URGENTE" -> {
            println("ALERTA URGENTE: Producto: $nombreProducto")
            println("Priorizar pedido")
            println("Revisar inventario en breve")
        }

        "MODERADO" -> {
            println("Nivel MODERADO: Producto: $nombreProducto")
            println("Monitorear stock regularmente")
        }

        "NORMAL" -> {
            println("Nivel NORMAL: Producto: $nombreProducto")
            println("Stock estable")
        }

        else -> {
            println("Nivel no reconocido")
        }
    }

}