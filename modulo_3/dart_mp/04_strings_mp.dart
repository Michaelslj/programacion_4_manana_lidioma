void main() {
  final producto = 'Laptop';
  final stock    = 5;

  print('Producto: $producto');

  print('${producto.toUpperCase()} quedará con ${stock - 1} unidades si vendes una');

  final tarjetaProducto = '''
  [ FICHA DE INVENTARIO ]
  Nombre: $producto
  Stock:  $stock
  Estado: ${stock > 0 ? 'Disponible' : 'Agotado'}
  ''';
  print(tarjetaProducto);

  final rutaReporte = r'C:\Inventario\Reportes';
  print(rutaReporte);

  final codigoProducto = 'PROD-' + producto + '-01';

  print('Mouse'.toUpperCase());
  print('  Cable HDMI  '.trim());
  print('Teclado Mecánico'.contains('Mec'));
  print('Código-01'.replaceAll('-', '_'));
  print('Manzanas,Peras,Uvas'.split(','));
  print('ID84920'.substring(0, 2));
  print('Memoria RAM'.startsWith('Mem'));
  print('7'.padLeft(4, '0'));
}