fun main() {

    // Solicitar nombre del producto
    println("Ingrese el nombre del producto:")
    val nombreProducto = readLine()
    println("Producto registrado: $nombreProducto")

    // Solicitar cantidad (con valor por defecto)
    println("Ingrese la cantidad del producto:")
    val cantidad = readLine() ?: "0"
    println("Cantidad registrada: $cantidad")

    // Solicitar precio
    println("Ingrese el precio del producto:")
    val precio = readLine()
    println("Precio registrado: $precio")

    /* Comentario multilinea
       Aquí podrías agregar lógica para almacenar productos
       en una lista o base de datos
    */

    // Comentario de una sola línea
    // Aquí podrías calcular el valor total del inventario

    /**
     * Función principal del sistema de inventario
     * @param nombreProducto Nombre del producto ingresado
     * @param cantidad Cantidad disponible
     * @param precio Precio del producto
     * @return Muestra los datos ingresados en consola
     */
}
    