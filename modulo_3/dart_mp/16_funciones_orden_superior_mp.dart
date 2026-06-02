void main() {
  final preciosBase = [29.99, 49.50, 15.00, 99.99];

  final preciosConImpuesto = preciosBase.map((p) => p * 1.15);
  print(preciosConImpuesto.toList());

  final categorias = ['electronicos', 'hogar', 'oficina'];
  final rutasCategorias = categorias.map((c) => 'https://api.inventario.com/stock/$c');
  print(rutasCategorias.toList());

  final nivelesStock = [36, 8, 92, 4, 87, 0];

  final stockCritico = nivelesStock.where((s) => s < 10);
  print(stockCritico.toList());

  final stockOptimo = nivelesStock.where((s) => s >= 10 && s <= 50);
  print(stockOptimo.toList());

  final costosLotes = [1500.0, 2300.0, 980.0, 3100.0, 750.0];

  final costoTotal = costosLotes.reduce((acum, costo) => acum + costo);
  print('Total valorizado: \$${costoTotal.toStringAsFixed(2)}');

  final costoTotalFold = costosLotes.fold(0.0, (acum, costo) => acum + costo);
  print('Total valorizado (fold): \$${costoTotalFold.toStringAsFixed(2)}');

  final loteMasCaro = costosLotes.reduce((a, b) => a > b ? a : b);
  print('Lote de mayor valor: \$$loteMasCaro');
}