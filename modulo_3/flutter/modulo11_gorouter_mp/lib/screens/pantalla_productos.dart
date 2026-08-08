// lib/screens/pantalla_productos.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/models/producto.dart';

class PantallaProductos extends StatelessWidget {
  const PantallaProductos({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final productos = productosSimulados;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Productos'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount:   productos.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.inventory_2),
          title:   Text(productos[i].nombre),
          onTap: () {
            // context.push() — apila la pantalla (aparece botón "atrás")
            context.push('/productos/${productos[i].id}', extra: productos[i]);
          },
        ),
      ),
    );
  }
}