import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:modulo12_api_mp/proveedor_dto.dart';

class PantallaPaso3Users extends StatelessWidget {
  const PantallaPaso3Users({super.key});

  Future<List<ProveedorDto>> _fetchProveedores() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (res.statusCode != 200) {
      throw Exception('Error al cargar proveedores: ${res.statusCode}');
    }

    final body = jsonDecode(res.body) as List<dynamic>;
    return body
        .cast<Map<String, dynamic>>()
        .map(ProveedorDto.fromJson)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3-Proveedores · Lista completa'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<ProveedorDto>>(
        future: _fetchProveedores(),
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

          final proveedores = snap.data ?? [];
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemCount: proveedores.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final proveedor = proveedores[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(proveedor.id.toString()),
                ),
                title: Text(proveedor.nombreProveedor),
                subtitle: Text(proveedor.correo),
              );
            },
          );
        },
      ),
    );
  }
}