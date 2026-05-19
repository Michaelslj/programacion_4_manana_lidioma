import 'dart:io';

void main(){
    print('Ingrese la nota que saco');
    int nota = int.parse(stdin.readLineSync()!);
    
    if (nota >=7) {
        print('Aprobado');
    } else if (nota < 7) {
        print('Reprobado');
    } else {
        print('Nota no valida');
    }
}