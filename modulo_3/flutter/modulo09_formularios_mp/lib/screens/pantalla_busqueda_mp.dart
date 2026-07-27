// lib/screens/pantalla_busqueda.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/producto_ssh_mp.dart';
import 'package:modulo09_formularios_mp/widgets/fila_servidor_mp.dart';
import 'package:modulo09_formularios_mp/widgets/tarjeta_producto_grid_mp.dart';


class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});
  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _productos = [
    Producto(id:'1', nombre:'Audífonos inalámbricos', ubicacion:'10.2.1.10',   cantidad:22,   proveedor:'TechSound SA',   categoria:'Electrónica',      enPromocion:true,  favorito:true, departamento: 'electronica'),
    Producto(id:'2', nombre:'Cargador USB-C',          ubicacion:'10.2.2.20',  cantidad:22,   proveedor:'PowerCell Corp', categoria:'Ropa',             enPromocion:true, departamento: 'electronica'),
    Producto(id:'3', nombre:'Teclado mecánico',        ubicacion:'10.3.1.10',  cantidad:5,    proveedor:'KeyTech',        categoria:'Electrónica',      enPromocion:false, departamento: 'electronica'),
    Producto(id:'4', nombre:'Mouse inalámbrico',       ubicacion:'192.1.1.5',  cantidad:15,   proveedor:'ClickPoint',     categoria:'Juguetes',         enPromocion:false, departamento: 'electronica'),
  ];

  String _busqueda = '';     // texto actual de la búsqueda
  bool   _modoGrid = false;

  // Getter calculado — filtra sin modificar _productos
  List<Producto> get _filtrados => _productos
      .where((p) =>
          p.nombre.toLowerCase().contains(_busqueda.toLowerCase()) ||
          p.ubicacion.contains(_busqueda) ||
          p.proveedor.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleFavorito(Producto p) =>
      setState(() => p.favorito = !p.favorito);

  void _eliminar(Producto p) =>
      setState(() => _productos.removeWhere((x) => x.id == p.id));

  @override
  Widget build(BuildContext context) {
    final cs       = Theme.of(context).colorScheme;
    final filtrados = _filtrados;   // evalúa el getter una sola vez

    return Scaffold(
      appBar: AppBar(
        title:           Text('Productos (${_productos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:      Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip:   _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: Column(
        children: [
          // ── SearchBar ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por nombre, ubicación o proveedor...',
              leading:  const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon:      const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),

          // ── Contador de resultados ────────────────────────────────
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),

          // ── Lista o Grid ──────────────────────────────────────────
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar búsqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:   2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing:  8,
                        ),
                        itemCount:   filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaProductoGrid(
                          producto:   filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount:        filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaProducto(
                          producto:   filtrados[i],
                          onFavorito: () => _toggleFavorito(filtrados[i]),
                          onEliminar: () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}