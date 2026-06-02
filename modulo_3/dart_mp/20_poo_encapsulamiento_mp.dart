class ItemInventario {
  final String nombre;
  int _stock;

  ItemInventario(this.nombre, int stockInicial)
      : _stock = stockInicial;

  int get stock => _stock;

  void registrarIngreso(int cantidad) {
    if (cantidad <= 0) throw ArgumentError('La cantidad debe ser positiva');
    _stock += cantidad;
    print('Ingreso: $cantidad unidades de $nombre. Nuevo stock: $_stock');
  }

  void registrarEgreso(int cantidad) {
    if (cantidad <= 0) throw ArgumentError('La cantidad debe ser positiva');
    if (cantidad > _stock) throw StateError('Stock insuficiente para el egreso');
    _stock -= cantidad;
    print('Egreso: $cantidad unidades de $nombre. Nuevo stock: $_stock');
  }
}

void main() {
  final producto = ItemInventario('Teclado Mecánico', 50);

  producto.registrarIngreso(20);
  producto.registrarEgreso(15);
  print(producto.stock);
}