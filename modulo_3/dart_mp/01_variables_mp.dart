void main() {

  // var — tipo inferido
  var producto = 'Laptop Gamer';   // String
  var stock = 10;                  // int
  var precio = 1200.50;            // double
  var disponible = true;           // bool

  // Tipo explícito
  String categoria = 'Electrónica';
  int codigo = 1001;
  double iva = 0.12;
  bool activo = true;

  // final — no se puede reasignar
  final sucursal = 'Matriz';

  // sucursal = 'Norte'; // ERROR

  // const — constante de compilación
  const stockMinimo = 5;
  const porcentajeIVA = 0.12;

  // Diferencia entre final y const
  final fechaActual = DateTime.now();

  // const fechaActual = DateTime.now(); // ERROR

  print(
    '$producto | $categoria | Stock: $stock | Precio: \$${precio}'
  );
}