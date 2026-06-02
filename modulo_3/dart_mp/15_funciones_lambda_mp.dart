void main() {
  final duplicarStock = (int n) => n * 2;
  print(duplicarStock(7));

  final calcularCostoTotal = (double precio, double impuesto) {
    final valorImpuesto = precio * (impuesto / 100);
    return precio + valorImpuesto;
  };
  print(calcularCostoTotal(100.0, 15.0));

  final precios = [3, 1, 4, 1, 5, 9, 2, 6];
  precios.sort((a, b) => b.compareTo(a));
  print(precios);
}