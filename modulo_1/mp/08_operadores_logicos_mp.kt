fun main() {

    println("=== OPERADORES LÓGICOS EN INVENTARIO ===")

    // Estados del sistema
    val hayStock = true
    val tienePermisoVenta = false
    val sistemaActivo = true

    println("¿Hay stock?: $hayStock")
    println("¿Tiene permiso de venta?: $tienePermisoVenta")
    println("¿Sistema activo?: $sistemaActivo")

    println("&& - AND lógico (todas deben cumplirse)")

    // Se puede vender solo si hay stock Y permiso
    println("¿Se puede vender?")
    println("$hayStock && $tienePermisoVenta = ${hayStock && tienePermisoVenta}")

    // Sistema funcionando correctamente
    println("¿Sistema operativo?")
    println("$sistemaActivo && $hayStock = ${sistemaActivo && hayStock}")

    println("|| - OR lógico (al menos una condición)")

    // Hay alguna condición favorable
    println("¿Hay alguna condición válida?")
    println("$hayStock || $tienePermisoVenta = ${hayStock || tienePermisoVenta}")

    println("$sistemaActivo || $hayStock = ${sistemaActivo || hayStock}")

    println("! - NOT lógico (negación)")

    // Negaciones
    println("No hay stock: ${!hayStock}")
    println("Sistema no activo: ${!sistemaActivo}")


}