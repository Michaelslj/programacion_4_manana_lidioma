import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'producto.dart';
import 'producto_dto.dart';

class PantallaPaso3 extends StatelessWidget {
  const PantallaPaso3({super.key});

  Future<List<Producto>> _fetchProductos() async {
    final res = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products?limit=15'),
    );

    if (res.statusCode != 200) {
      throw Exception('Error al cargar productos: ${res.statusCode}');
    }

    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => ProductoDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3 · API real — Productos (Platzi)'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<Producto>>(
        future: _fetchProductos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, size: 48, color: Colors.red),
                    const SizedBox(height: 12),
                    Text('Error: ${snap.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            );
          }

          final productos = snap.data ?? [];
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: productos.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final p = productos[i];
              return Card(
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      p.imagenUrl,
                      width:  56,
                      height: 56,
                      fit:    BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width:  56,
                        height: 56,
                        color:  Colors.grey[200],
                        child:  const Icon(Icons.inventory_2, color: Colors.grey),
                      ),
                    ),
                  ),
                  title: Text(p.nombre,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text(p.categoria),
                  trailing: Text(
                    '\$${p.precio.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}