class Producto {
  final int    id;
  final String nombre;
  final double precio;
  final String categoria;
  final String imagenUrl;

  const Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.categoria,
    required this.imagenUrl,
  });
}