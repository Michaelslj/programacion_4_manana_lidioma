// lib/router/app_router.dart
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_productos.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,  // imprime cada navegación en la consola
  routes: [
    GoRoute(
      path:    '/',
      name:    'inicio',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/productos',
      name:    'productos',
      builder: (context, state) => const PantallaProductos(),
    ),
  ],
);