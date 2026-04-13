fun main() {
    // No mutable (datos fijos del producto)
    val nombreProducto = "Laptop"
    val precio: Double = 850.99
    val codigoProducto = "A001"
    
    // Mutable (cantidad en inventario)
    var stock = 10
    
    // Entrada de productos (aumenta stock)
    stock = stock + 5
    println("Stock después de ingreso: $stock")
    
    // Salida de productos (disminuye stock)
    stock = stock - 3
    println("Stock después de venta: $stock")
    
    // Información del producto
    println("Producto: $nombreProducto | Código: $codigoProducto | Precio: $$precio")
}