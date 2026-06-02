void registrarProducto({
  required String nombre,
  required double precio,
  int stock = 0,
  String categoria = 'General',
}) {
  print('Producto: $nombre | Precio: \$$precio | Stock: $stock | Cat: $categoria');
}

void main() {
  registrarProducto(
    nombre: 'Laptop',
    precio: 899.99,
    stock: 15,
    categoria: 'Tecnología',
  );

  registrarProducto(
    nombre: 'Mouse',
    precio: 15.50,
  );
}