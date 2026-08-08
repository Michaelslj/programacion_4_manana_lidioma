// lib/router/app_router_paso3.dart
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/screens/pantalla_productos_filtro.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_detalle.dart';
import '../models/producto.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/productos',
      builder: (context, state) {
        // Query parameters — /productos?soloPromocion=true
        final soloPromocion = state.uri.queryParameters['soloPromocion'] == 'true';
        return PantallaProductosFiltro(soloPromocion: soloPromocion);
      },
    ),
    GoRoute(
      path:    '/productos/:id',
      builder: (context, state) {
        final id       = state.pathParameters['id']!;
        final producto = state.extra as Producto?;
        return PantallaDetalle(id: id, producto: producto);
      },
    ),
  ],
);