void main() {
  for (int i = 1; i <= 5; i++) {
    print('Producto número $i');
  }

  for (int i = 0; i <= 100; i += 25) {
    print('Capacidad de almacén: $i%');
  }

  for (int i = 5; i >= 1; i--) {
    print('Unidades en alerta de stock bajo: $i');
  }
}