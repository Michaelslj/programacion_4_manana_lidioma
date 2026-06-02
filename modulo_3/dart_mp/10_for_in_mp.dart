void main() {
  final productos = ['Laptop', 'Mouse', 'Teclado', 'Monitor', 'Impresora'];

  for (final producto in productos) {
    print(producto);
  }

  productos.forEach((p) => print(p.toLowerCase()));

  final inventario = {'Laptop': 15, 'Mouse': 50, 'Teclado': 30, 'Monitor': 10};
  for (final entrada in inventario.entries) {
    print('${entrada.key} → stock: ${entrada.value}');
  }

  for (final caracter in 'PROD') {
    print(caracter);
  }
}