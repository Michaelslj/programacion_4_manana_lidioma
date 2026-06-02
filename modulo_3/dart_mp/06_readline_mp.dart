import 'dart:io';

void main() {
  print('Ingrese el nombre del producto:');
  String? nombreProducto = stdin.readLineSync();
  print('Producto registrado: $nombreProducto');

  print('Ingrese la cantidad en stock:');
  int stock = int.parse(stdin.readLineSync()!);
  print('Stock actual: $stock');

  print('Ingrese el precio del producto:');
  double precio = double.parse(stdin.readLineSync()!);
  print('Precio: $precio');

  print('Ingrese la cantidad a validar:');
  int cantidadValidar = int.parse(stdin.readLineSync()!);

  if (cantidadValidar > 0) {
    print('Disponible para venta');
  } else if (cantidadValidar < 0) {
    print('Error: Cantidad no válida');
  } else {
    print('Sin existencias');
  }
}