import 'dart:io';

void main(){
    print('Ingrese un numero entero');
    int numeroent = int.parse(stdin.readLineSync()!);
    
    if (numeroent >0) {
        print('Positivo');
    } else if (numeroent < 0) {
        print('Negativo');
    } else {
        print('Cero');
    }
}