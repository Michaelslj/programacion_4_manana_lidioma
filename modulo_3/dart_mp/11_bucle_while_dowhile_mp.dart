void main() {
  int itemsPorProcesar = 1024;
  int lotes = 0;

  while (itemsPorProcesar > 0) {
    final cantidadLote = itemsPorProcesar > 256 ? 256 : itemsPorProcesar;
    lotes++;
    itemsPorProcesar -= cantidadLote;
    print('Lote $lotes: $cantidadLote productos (restante: $itemsPorProcesar)');
  }

  int intentosCarga = 0;
  bool guardadoExitoso = false;

  do {
    intentosCarga++;
    print('Intento de guardar inventario #$intentosCarga...');
    if (intentosCarga == 3) guardadoExitoso = true;
  } while (!guardadoExitoso && intentosCarga < 5);

  print(guardadoExitoso
      ? 'Inventario guardado tras $intentosCarga intentos'
      : 'Error al guardar el inventario');
}