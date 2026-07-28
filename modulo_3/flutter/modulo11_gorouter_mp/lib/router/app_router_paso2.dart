// lib/router/app_router_paso2.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_productos.dart';
import '../screens/pantalla_detalle.dart';
import '../models/producto.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/productos',
      builder: (context, state) => const PantallaProductos(),
      routes: [
        // Ruta hija: /productos/:id
        GoRoute(
          path:    ':id',   // relativa — ruta completa: /productos/:id
          builder: (context, state) {
            final id       = state.pathParameters['id']!;
            final producto = state.extra as Producto?;
            return PantallaDetalle(id: id, producto: producto);
          },
        ),
        // Ruta hija: /productos/:id/logs
        GoRoute(
          path:    ':id/logs',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Movimientos de $id')),
              body:   Center(child: Text('Movimientos del producto $id')),
            );
          },
        ),
      ],
    ),
  ],
);