// lib/models/producto.dart
class Producto {
  final String id;
  final String nombre;
  final String ubicacion;
  final int    cantidad;
  final bool   enPromocion;
  bool         favorito;

  Producto({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.cantidad,
    required this.enPromocion,
    this.favorito = false,
  });
}