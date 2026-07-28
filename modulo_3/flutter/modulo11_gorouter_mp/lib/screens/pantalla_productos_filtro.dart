// lib/screens/pantalla_productos_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/producto.dart';

class PantallaProductosFiltro extends StatelessWidget {
  final bool soloPromocion;
  const PantallaProductosFiltro({super.key, this.soloPromocion = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloPromocion
        ? productosSimulados.where((p) => p.enPromocion).toList()
        : productosSimulados;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Productos${soloPromocion ? ' (Promoción)' : ''}'),
        actions: [
          // Toggle filtro promoción — cambia la URL con query param
          IconButton(
            icon:    Icon(soloPromocion ? Icons.local_offer : Icons.local_offer_outlined),
            tooltip: soloPromocion ? 'Ver todos' : 'Solo promoción',
            onPressed: () => soloPromocion
                ? context.go('/productos')
                : context.go('/productos?soloPromocion=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final p = filtrados[i];
          return ListTile(
            leading: Icon(Icons.inventory_2, color: p.enPromocion ? Colors.green : Colors.grey),
            title:   Text(p.nombre),
            subtitle: Text(p.ubicacion),
            onTap: () => context.push(
              '/productos/${p.id}',
              extra: p,   // pasa el objeto completo
            ),
          );
        },
      ),
    );
  }
}