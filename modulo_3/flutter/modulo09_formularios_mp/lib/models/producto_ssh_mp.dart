class Producto {
  final String id;
  final String nombre;
  final String ubicacion;
  final int    cantidad;
  final String proveedor;
  final String categoria;
  final bool   enPromocion;
  final String departamento;
  bool         favorito;    // mutable — puede cambiar sin recrear el objeto

  Producto({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.cantidad,
    required this.proveedor,
    required this.categoria,
    required this.enPromocion,
    required this.departamento,
    this.favorito = false,
  });
}