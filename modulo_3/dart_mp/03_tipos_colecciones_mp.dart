void main() {

  List<String> productos = [
    'Laptop',
    'Mouse',
    'Teclado'
  ];

  var stock = [10, 5, 8, 15];

  print(productos[0]);
  print(productos.length);

  productos.add('Monitor');
  productos.remove('Mouse');

  Map<String, int> inventario = {
    'Laptop': 10,
    'Teclado': 15,
    'Monitor': 5,
  };

  print(inventario['Laptop']);
  print(inventario['Impresora']);

  inventario['Mouse'] = 20;

  Set<String> categorias = {
    'Computadoras',
    'Periféricos',
    'Audio'
  };

  categorias.add('Audio');

  print(categorias.length);

  var sucursal1 = ['Laptop', 'Mouse'];
  var sucursal2 = ['Monitor', 'Teclado'];

  var productosTotales = [
    ...sucursal1,
    ...sucursal2
  ];

  print(productosTotales);

  bool mostrarAgotados = true;

  var estados = [
    'Disponible',
    'Stock Bajo',
    if (mostrarAgotados) 'Agotado',
  ];

  print(estados);

  var cantidades = [
    for (var i = 1; i <= 5; i++) i * 10
  ];

  print(cantidades);
}