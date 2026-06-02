int aplicarDescuento(int precio) => (precio * 0.9).toInt();
int aplicarImpuesto(int precio) => (precio * 1.15).toInt();

void main() {
  int Function(int) calcularPrecioFinal;

  calcularPrecioFinal = aplicarDescuento;
  print(calcularPrecioFinal(100));

  calcularPrecioFinal = aplicarImpuesto;
  print(calcularPrecioFinal(100));

  final ajustesInventario = <int Function(int)>[aplicarDescuento, aplicarImpuesto];
  for (final calcular in ajustesInventario) {
    print(calcular(200));
  }
}