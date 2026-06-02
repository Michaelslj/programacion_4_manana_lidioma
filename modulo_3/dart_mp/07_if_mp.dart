void main() {
  int stock = 38;

  if (stock > 20) {
    print('Stock alto');
  } else if (stock > 0) {
    print('Stock bajo');
  } else {
    print('Sin stock');
  }

  String estadoProducto = stock > 0 ? 'Disponible' : 'Agotado';
  print(estadoProducto);

  String? categoria;
  String displayCategoria = categoria != null ? categoria.toUpperCase() : 'Sin categoria';

  String displayCategoria2 = categoria?.toUpperCase() ?? 'Sin categoria';
  print(displayCategoria2);
}