abstract class Producto {
  String get nombre;
  double calcularValorInventario();
}

class ProductoIndividual extends Producto {
  @override
  final String nombre;
  final double precio;
  final int stock;

  ProductoIndividual(this.nombre, this.precio, this.stock);

  @override
  double calcularValorInventario() => precio * stock;
}

class ProductoPorLote extends Producto {
  @override
  final String nombre;
  final double precioPorCaja;
  final int cajas;

  ProductoPorLote(this.nombre, this.precioPorCaja, this.cajas);

  @override
  double calcularValorInventario() => precioPorCaja * cajas;
}

class ProductoEnOferta extends Producto {
  @override
  final String nombre;
  final double precioOriginal;
  final int stock;
  final double descuento;

  ProductoEnOferta(this.nombre, this.precioOriginal, this.stock, this.descuento);

  @override
  double calcularValorInventario() => (precioOriginal - descuento) * stock;
}

void imprimirValorItem(Producto producto) {
  print('${producto.nombre}: \$${producto.calcularValorInventario().toStringAsFixed(2)}');
}

void main() {
  final inventario = <Producto>[
    ProductoIndividual('Laptop', 800.00, 5),
    ProductoPorLote('Cables HDMI', 120.00, 3),
    ProductoEnOferta('Monitor Gamin', 300.00, 4, 50.00),
  ];

  for (final item in inventario) {
    imprimirValorItem(item);
  }

  final loteMayorValor = inventario.reduce((a, b) => a.calcularValorInventario() > b.calcularValorInventario() ? a : b);
  print('\nLote con mayor valor acumulado: ${loteMayorValor.nombre}');
}