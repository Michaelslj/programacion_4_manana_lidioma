// lib/models/metrica_producto.dart
class MetricaProducto {
  final String producto;
  final double precision;
  final double ocupacion;
  final double mermas;
  final int movimientos;

  const MetricaProducto({
    required this.producto,
    required this.precision,
    required this.ocupacion,
    required this.mermas,
    required this.movimientos,
  });
}