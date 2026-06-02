abstract class ElementoInventario {
  String get nombre;
  double calcularValorTotal();
  bool necesitaReabastecimiento();

  void mostrarEstado() {
    print('$nombre — Valor Total: \$${calcularValorTotal().toStringAsFixed(2)}, '
          'Estado: ${necesitaReabastecimiento() ? "ALERTA REABASTECER" : "STOCK OK"}');
  }
}

class ProductoElectronico extends ElementoInventario {
  @override
  final String nombre;
  final double precio;
  final int stock;

  ProductoElectronico(this.nombre, this.precio, this.stock);

  @override
  double calcularValorTotal() => precio * stock;

  @override
  bool necesitaReabastecimiento() => stock < 5;
}

class ProductoLote extends ElementoInventario {
  @override
  final String nombre;
  final double precioPorUnidad;
  final int unidadesPorCaja;
  final int cajasDisponibles;

  ProductoLote(this.nombre, this.precioPorUnidad, this.unidadesPorCaja, this.cajasDisponibles);

  @override
  double calcularValorTotal() => precioPorUnidad * unidadesPorCaja * cajasDisponibles;

  @override
  bool necesitaReabastecimiento() => cajasDisponibles < 2;
}

void main() {
  final inventario = <ElementoInventario>[
    ProductoElectronico('Laptop', 800.00, 3),
    ProductoLote('Cables HDMI', 2.50, 50, 4)
  ];

  for (final item in inventario) {
    item.mostrarEstado();
  }
}