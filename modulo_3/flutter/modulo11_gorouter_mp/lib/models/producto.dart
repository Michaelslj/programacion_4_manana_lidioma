class Producto {
  final String id;
  final String nombre;
  final String ubicacion;
  final int    cantidad;
  final bool   enPromocion;

  const Producto({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.cantidad,
    required this.enPromocion,
  });
}

// Lista simulada — en una app real vendría de un provider
const productosSimulados = [
  Producto(id: '1', nombre: 'Audífonos inalámbricos', ubicacion: '10.2.1.10', cantidad: 22,   enPromocion: true),
  Producto(id: '2', nombre: 'Cargador USB-C',          ubicacion: '10.2.2.20', cantidad: 22,   enPromocion: true),
  Producto(id: '3', nombre: 'Teclado mecánico',        ubicacion: '10.3.1.10', cantidad: 2222, enPromocion: false),
];