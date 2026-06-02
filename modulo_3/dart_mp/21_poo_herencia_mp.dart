class Producto {
  final String nombre;
  final double precio;

  Producto(this.nombre, this.precio);

  String obtenerTipo() => 'Genérico';

  void mostrarDetalle() {
    print('Producto: $nombre | Categoría: ${obtenerTipo()} | Precio: \$$precio');
  }
}

class ProductoElectronico extends Producto {
  ProductoElectronico(super.nombre, super.precio);

  @override
  String obtenerTipo() => 'Electrónica';

  void verificarGarantia() => print('Verificando garantía para el producto: $nombre 🛡️');
}

class ProductoAlimento extends Producto {
  ProductoAlimento(super.nombre, super.precio);

  @override
  String obtenerTipo() => 'Alimento';

  void verificarCaducidad() => print('Verificando fecha de caducidad para el producto: $nombre 🗓️');
}

void main() {
  final laptop = ProductoElectronico('Laptop', 850.00);
  final leche = ProductoAlimento('Leche Litro', 1.20);

  laptop.mostrarDetalle();
  leche.mostrarDetalle();

  laptop.verificarGarantia();
  leche.verificarCaducidad();
}