class Producto {
  final String nombre;
  final String codigo;
  final double precio;
  final int stock;

  Producto({
    required this.nombre,
    required this.codigo,
    required this.precio,
    this.stock = 0,
  });

  Producto.sinStock({required this.nombre, required this.codigo, required this.precio})
      : stock = 0;

  Producto.promocional({required this.nombre, required this.codigo, required this.stock})
      : precio = 0.99;

  factory Producto.desdeLineaCSV(String linea) {
    final partes = linea.split(',');
    return Producto(
      nombre: partes[0],
      codigo: partes[1],
      precio: double.parse(partes[2]),
      stock: int.parse(partes[3]),
    );
  }

  @override
  String toString() =>
      '$nombre ($codigo) - \$$precio - Stock: $stock';
}

void main() {
  final p1 = Producto(nombre: 'Laptop', codigo: 'PROD-01', precio: 799.99, stock: 10);
  final p2 = Producto.sinStock(nombre: 'Mouse', codigo: 'PROD-02', precio: 15.50);
  final p3 = Producto.promocional(nombre: 'Llavero', codigo: 'PROD-03', stock: 100);
  final p4 = Producto.desdeLineaCSV('Teclado,PROD-04,45.00,25');

  print(p1);
  print(p2);
  print(p3);
  print(p4);
}