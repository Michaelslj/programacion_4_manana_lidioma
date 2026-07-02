import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class PantallaPaso1Users extends StatelessWidget {
  const PantallaPaso1Users({super.key});

  Future<Map<String, dynamic>> _fetchUser() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 1 · FutureBuilder crudo - Users'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchUser(),
          builder: (context, snap) {
            // Estado 1: esperando respuesta
            if (snap.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            // Estado 2: error de red
            if (snap.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  Text('Error: ${snap.error}',
                      style: const TextStyle(color: Colors.red)),
                ],
              );
            }
            // Estado 3: datos disponibles
            final user = snap.data!;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.task_alt, size: 48, color: Colors.green),
                  const SizedBox(height: 16),
                  Text('ID: ${user['id']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text('Nombre: ${user['name']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(
                    user['email'] as String,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text((user['website']) ),
                    backgroundColor: Colors.green[100]

                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}