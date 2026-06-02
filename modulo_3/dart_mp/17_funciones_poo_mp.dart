class Producto {
  final String id;
  final String nombre;
  double precio;
  int _stock = 0;

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
  });

  int get stock => _stock;
  String get estado => _stock > 0 ? 'disponible' : 'agotado';

  set controlarStock(int valor) {
    if (valor >= 0) {
      _stock = valor;
      print('$nombre actualizado. Stock actual: $_stock');
    } else {
      print('Error: El stock de $nombre no puede ser negativo.');
    }
  }

  void agregarStock(int cantidad) {
    _stock += cantidad;
    print('Se agregaron $cantidad unidades a $nombre');
  }

  void retirarStock(int cantidad) {
    if (_stock >= cantidad) {
      _stock -= cantidad;
      print('Se retiraron $cantidad unidades de $nombre');
    } else {
      print('Stock insuficiente de $nombre');
    }
  }

  String resumen() => 'ID: $id | Nombre: $nombre | Precio: \$$precio | Estado: $estado';

  @override
  String toString() => 'Producto($nombre, \$$precio, $estado)';
}

void main() {
  final laptop = Producto(
    id: 'PROD-001',
    nombre: 'Laptop Asus',
    precio: 799.99,
  );

  laptop.agregarStock(15);
  print(laptop.estado);
  print(laptop.resumen());
  print(laptop);

  laptop.controlarStock = 0;
  print(laptop.stock);
}