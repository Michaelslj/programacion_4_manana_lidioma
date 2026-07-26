// lib/screens/pantalla_navegacion.dart
import 'package:flutter/material.dart';

class PantallaNavegacion extends StatefulWidget {
  const PantallaNavegacion({super.key});

  @override
  State<PantallaNavegacion> createState() => _PantallaNavegacionState();
}

class _PantallaNavegacionState extends State<PantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Sistema de Inventario'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaDashboard(),
          _PantallaProductos(),
          _PantallaAlertas(),
          _PantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.primaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label:        'Dashboard',
          ),
          NavigationDestination(
            icon:         Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label:        'Productos',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('3'), child: Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(label: Text('3'), child: Icon(Icons.notifications)),
            label:        'Alertas',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Ajustes',
          ),
        ],
      ),
    );
  }
}

// ─── Pantallas de cada pestaña ────────────────────────────────────────────

class _PantallaDashboard extends StatelessWidget {
  const _PantallaDashboard();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen', style: text.headlineSmall),
        const SizedBox(height: 16),
        // Tarjetas de métricas
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Productos', valor: '8',  icono: Icons.inventory_2,   color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Alertas',    valor: '3',  icono: Icons.notifications, color: cs.tertiaryContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Ventas hoy', valor: '24',   icono: Icons.trending_up,  color: cs.tertiaryContainer)),
          Expanded(child: _TarjetaMetrica(titulo: 'Ingresos',   valor: '\$4.2K', icono: Icons.attach_money, color: cs.secondaryContainer)),
        ]),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _TarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaProductos extends StatelessWidget {
  const _PantallaProductos();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (ctx, i) => Card(
        child: ListTile(
          leading:  Icon(Icons.inventory_2, color: cs.primary),
          title:    Text('Producto SKU-00${i + 1}'),
          subtitle: Text('Bodega ${i + 10} · Disponible'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          onTap: () {},
        ),
      ),
    );
  }
}

class _PantallaAlertas extends StatelessWidget {
  const _PantallaAlertas();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const alertas = [
      (producto: 'Audífonos inalámbricos', mensaje: 'Stock < 5 unidades',        nivel: 'CRÍTICO'),
      (producto: 'Cargador USB-C',         mensaje: 'Sin movimiento en 30 días', nivel: 'AVISO'),
      (producto: 'Monitor 24 pulgadas',    mensaje: 'Conteo físico pendiente',   nivel: 'CRÍTICO'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: alertas.length,
      itemBuilder: (ctx, i) {
        final alerta = alertas[i];
        final esCritico = alerta.nivel == 'CRÍTICO';

        return Card(
          color: esCritico ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(
              esCritico ? Icons.error : Icons.warning,
              color: esCritico ? cs.onErrorContainer : cs.onTertiaryContainer,
            ),
            title: Text(alerta.producto,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(alerta.mensaje),
            trailing: Chip(
              label: Text(alerta.nivel, style: const TextStyle(fontSize: 11)),
              backgroundColor: esCritico ? cs.error : cs.tertiary,
              labelStyle: TextStyle(
                color: esCritico ? cs.onError : cs.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PantallaAjustes extends StatelessWidget {
  const _PantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title:   Text('Notificaciones'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.security_outlined),
          title:   Text('Seguridad'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title:   Text('Acerca de'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}