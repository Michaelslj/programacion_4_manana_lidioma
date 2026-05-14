interface Registrable {

    val id: String

    fun registrar(): String

    val version: Int
        get() = 1
}

interface ValidarProducto {

    val errores: List<String>

    val esValido: Boolean
        get() = errores.isEmpty()

    fun validar(): Boolean

    fun imprimirErrores() {

        if (errores.isEmpty()) {

            println("Sin errores")

        } else {

            errores.forEach {

                println("❌ $it")
            }
        }
    }
}

// POLIMORFISMO
data class Producto(
    override val id: String,
    val nombre: String,
    val stock: Int,
    val precio: Double
) : Registrable, ValidarProducto {

    override fun registrar() =
        "$id|$nombre|$stock|$precio"

    override val errores: List<String>
        get() = buildList {

            if (nombre.isBlank()) {

                add("Nombre vacío")
            }

            if (stock < 0) {

                add("Stock inválido")
            }

            if (precio <= 0) {

                add("Precio inválido")
            }
        }

    override fun validar() =
        esValido
}

fun main() {

    val producto1 = Producto(
        "P001",
        "Laptop Gamer",
        5,
        1200.0
    )

    val producto2 = Producto(
        "P002",
        "",
        -1,
        0.0
    )

    fun procesarRegistro(r: Registrable) {

        println(
            "→ ${r.registrar()}"
        )
    }

    fun procesarValidacion(v: ValidarProducto) {

        println(
            "Válido: ${v.esValido}"
        )

        v.imprimirErrores()
    }

    procesarRegistro(producto1)

    procesarValidacion(producto1)

    procesarValidacion(producto2)
}