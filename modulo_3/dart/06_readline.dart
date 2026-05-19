import 'dart:io';

void main(){
    print('Ingrese su nombre:');
    String? nombre = stdin.readLineSync();
    print('Hola $nombre');

    print('Ingrese un numero entero');
    int numero = int.parse(stdin.readLineSync()!);
    print('Numero $numero');

    print('Ingrese un decimal');
    double valor = double.parse(stdin.readLineSync()!);
    print('Valor: $valor');


    print('Ingrese un numero entero');
    int numeroent = int,parse(stdin.readLineSync()!);
    
    if (numeroent >0) {
        print('Positivo');
    } else if (numeroent < 0) {
        print('Negativo');
    } else {
        print('Cero');
    }
}