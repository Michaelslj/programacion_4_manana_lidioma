void mostrarMenu() {
  print('--- SISTEMA DE INVENTARIO ---');
}

int calcularStockInicial() {
  return 100 + 50;
}

int actualizarStock(int actual, int cantidad) {
  return actual + cantidad;
}

int calcularTotalLote(int cantidad, int precio) => cantidad * precio;

void mostrarAlerta(String mensaje) {
  print('⚠️ ALERTA: $mensaje ⚠️');
}

String formatearCosto(double costo) => '\$${costo.toStringAsFixed(2)}';

generarCodigoAlternativo(double codigo) => 'ID-${codigo.toStringAsFixed(0)}';

String generarReporte(String producto, String categoria, [String? ubicacion]) {
  if (ubicacion != null) {
    return 'Producto: $producto | Cat: $categoria | Pasillo: $ubicacion';
  }
  return 'Producto: $producto | Cat: $categoria';
}

String generarReporteV2(String producto, String categoria, [int bodega = 1]) {
  return 'Producto: $producto | Cat: $categoria | Bodega: $bodega';
}

void main() {
  mostrarMenu();
  print(calcularStockInicial());
  print(actualizarStock(150, 25));
  print(calcularTotalLote(10, 5));
  mostrarAlerta('Stock mínimo alcanzado');
  print(formatearCosto(450.5));
  print(generarCodigoAlternativo(102.0));
  print(generarReporte('Laptop', 'Tecnología'));
  print(generarReporte('Mouse', 'Tecnología', 'A-3'));
  print(generarReporteV2('Teclado', 'Tecnología'));
}