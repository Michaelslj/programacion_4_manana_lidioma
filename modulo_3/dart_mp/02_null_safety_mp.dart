void main() {

  String producto = 'Laptop Gamer';

  String? categoria = null;

  categoria = 'Electrónica';

  String? proveedor;

  print(proveedor?.length);

  // ??
  String nombreProveedor =
      proveedor ?? 'Sin proveedor';

  print(nombreProveedor);


  if (categoria != null) {

    print(categoria.length);
  }

  late String codigoProducto;

  codigoProducto = 'P001';

  print(codigoProducto);
}