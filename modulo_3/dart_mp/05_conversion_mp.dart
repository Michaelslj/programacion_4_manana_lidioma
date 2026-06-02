void main() {
  int stock = 42;
  double precio = stock.toDouble();
  String codigo = stock.toString();

  int stockEntrante = int.parse('123');
  double precioEntrante = double.parse('3.14');

  int? stockManual = int.tryParse('abc');
  double? precioManual = double.tryParse('99');

  Object item = 'Producto Nuevo';
  if (item is String) {
    print(item.length);
  }

  Object datos = 'Laptop';
  String nombreProducto = datos as String;

  String? descripcion = null;
  int longitudDescripcion = descripcion?.length ?? 0;
  print(longitudDescripcion);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}