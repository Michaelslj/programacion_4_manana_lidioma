// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo06_widgets_mp/widgets_mp/catalogo_inventario_mp.dart';
import 'package:modulo06_widgets_mp/widgets_mp/contador_stock_mp.dart';
import 'package:modulo06_widgets_mp/widgets_mp/etiqueta_producto_mp.dart';
import 'package:modulo06_widgets_mp/widgets_mp/pantalla_contexto_inventario_mp.dart';
import 'package:modulo06_widgets_mp/widgets_mp/producto_estado_mp.dart';
import 'package:modulo06_widgets_mp/widgets_mp/temporizador_estado_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                        │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 8;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.deepPurple,       // ← cambia aquí
      brightness: Brightness.dark,     // ← Brightness.dark para modo oscuro
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
      1 => const Scaffold(body: Center(child: Saludo())),
      2 => const CatalogoInventario(),
      3 => const Scaffold(
        body: Center(
          child: Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              EtiquetaProducto(texto: 'Disponible', color: Colors.green),
              EtiquetaProducto(texto: 'Agotado', color: Colors.red, relleno: true),
              EtiquetaProducto(texto: 'En espera', color: Colors.orange),
              EtiquetaProducto(
                texto: 'Crítico',
                color: Colors.red,
                fontSize: 16,
                relleno: true,
              ),
              EtiquetaProducto(texto: 'Info', color: Colors.blue, fontSize: 11),
            ],
          ),
        ),
      ),
      4 => const Scaffold(
        body: Center(child: ProductoEstado(nombre: 'Audífonos inalámbricos A101')),
      ),
      5 => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorStock(
              producto: 'Intentos de reabastecimiento',
              stockMaximo: 1,
              color: Colors.deepPurple,
              textoBoton: 'Intentar',
              pasoIncremento: 1,
              onStockLleno: () => debugPrint('¡Producto bloqueado!'),
            ),

            const SizedBox(height: 40),

            ContadorStock(
              producto: 'Unidades en bodega',
              stockMaximo: 10,
              color: Colors.deepPurple,
              textoBoton: 'Sumar',
              pasoIncremento: 2,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                              // Paso 4
      appBar: AppBar(title: const Text('Cronómetro')),
      body: const Center(child: TemporizadorInventario()),
    ),
    7 => const PantallaContextoInventario(),    // Paso 5 — ya tiene su propio Scaffold
      _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero')),
      ),
    },
  ),
);

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    // describe cómo se ve
    return const Text(
      'Inventario listo para el conteo',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepPurple,
        shadows: [
          Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(4, 1)),
        ],
      ),
      textAlign: TextAlign.center,
      // overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}