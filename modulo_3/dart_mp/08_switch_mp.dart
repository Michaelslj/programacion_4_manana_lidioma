void main() {
  String estadoEntrega = 'ENTREGADO';

  switch (estadoEntrega) {
    case 'PENDIENTE':
      print('El pedido está en espera');
    case 'EN_CAMINO':
      print('El pedido va hacia su destino');
    case 'ENTREGADO':
      print('El pedido ya fue recibido');
    case 'CANCELADO':
      print('El pedido fue anulado');
    default:
      print('Estado de entrega no reconocido');
  }

  String codigoCategoria = 'CAT_02';

  String descripcionCategoria = switch (codigoCategoria) {
    'CAT_01' => 'Tecnología — Electrónicos y gadgets',
    'CAT_02' => 'Hogar — Muebles y decoración',
    'CAT_03' => 'Oficina — Papelería y suministros',
    'CAT_04' => 'Ropa — Vestimenta y calzado',
    _        => 'Categoría general no especificada',
  };

  print(descripcionCategoria);

  Object datosInventario = {'id': 1, 'nombre': 'Laptop', 'stock': 15};

  String resultadoOperacion = switch (datosInventario) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error en inventario: ${m['error']}',
    Map<String, dynamic> m =>
        'Producto: ${m['nombre']} — Stock: ${m['stock']}',
    List<dynamic> lista =>
        'Lote con ${lista.length} productos cargados',
    String texto =>
        'Mensaje de sistema: $texto',
    _ =>
        'Origen de datos no compatible',
  };

  print(resultadoOperacion);
}