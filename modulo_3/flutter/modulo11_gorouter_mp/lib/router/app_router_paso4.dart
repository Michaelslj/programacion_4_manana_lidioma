// lib/router/app_router_paso4.dart
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/screens/scaffold_con_nav.dart';
import '../screens/pantalla_dashboard.dart';
import '../screens/pantalla_productos.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_metricas.dart';
import '../screens/pantalla_ajustes.dart';
import '../models/producto.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/dashboard',
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute — mantiene ScaffoldConNav vivo entre rutas hijas
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/dashboard',
          builder: (context, state) => const PantallaDashboard(),
        ),
        GoRoute(
          path:    '/productos',
          builder: (context, state) => const PantallaProductos(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id       = state.pathParameters['id']!;
                final producto = state.extra as Producto?;
                return PantallaDetalle(id: id, producto: producto);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/metricas',
          builder: (context, state) => const PantallaMetricas(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (context, state) => const PantallaAjustes(),
        ),
      ],
    ),
  ],
);