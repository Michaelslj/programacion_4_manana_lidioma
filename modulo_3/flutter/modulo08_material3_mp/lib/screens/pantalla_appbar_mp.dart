// lib/screens/pantalla_appbar.dart
import 'package:flutter/material.dart';

class PantallaAppBar extends StatelessWidget {
  const PantallaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar — colapsa al hacer scroll
          SliverAppBar.large(
            title:           const Text('Productos'),
            pinned:          true,
            backgroundColor: cs.primaryContainer,
            foregroundColor: cs.onPrimaryContainer,
            actions: [
              IconButton(
                icon:      const Icon(Icons.filter_list),
                onPressed: () {},
                tooltip:   'Filtrar',
              ),
              IconButton(
                icon:      const Icon(Icons.search),
                onPressed: () {},
                tooltip:   'Buscar',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: cs.primaryContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Icon(Icons.inventory_2, size: 48, color: cs.onPrimaryContainer),
                    const SizedBox(height: 8),
                    Text(
                      '8 productos en stock',
                      style: TextStyle(color: cs.onPrimaryContainer),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Lista de productos
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Card(
                  child: ListTile(
                    leading:  Icon(Icons.inventory_2, color: cs.primary),
                    title:    Text('Producto SKU-00${i + 1}'),
                    subtitle: Text('Bodega ${i + 10} · Disponible'),
                    trailing: Chip(
                      label:           const Text('OK'),
                      backgroundColor: cs.primaryContainer,
                      labelStyle:      TextStyle(color: cs.onPrimaryContainer),
                    ),
                    onTap: () {},
                  ),
                ),
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}