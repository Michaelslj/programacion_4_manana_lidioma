// lib/screens/pantalla_productos.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/producto_ssh_mp.dart';
import 'package:modulo09_formularios_mp/widgets/fila_servidor_mp.dart';
import 'package:modulo09_formularios_mp/widgets/tarjeta_producto_grid_mp.dart';


class PantallaProductos extends StatefulWidget {
  const PantallaProductos({super.key});
  @override
  State<PantallaProductos> createState() => _PantallaProductosState();
}

class _PantallaProductosState extends State<PantallaProductos> {
  final _productos = [
    Producto(id:'1', nombre:'Audífonos inalámbricos', ubicacion:'10.2.1.10',   cantidad:22,   proveedor:'TechSound SA',   categoria:'Electrónica',      enPromocion:true,  favorito:true, departamento: 'electronica'),
    Producto(id:'2', nombre:'Cargador USB-C',          ubicacion:'10.2.2.20',  cantidad:22,   proveedor:'PowerCell Corp', categoria:'Ropa',             enPromocion:true, departamento: 'electronica'),
    Producto(id:'3', nombre:'Teclado mecánico',        ubicacion:'10.3.1.10',  cantidad:5,    proveedor:'KeyTech',        categoria:'Electrónica',      enPromocion:false, departamento: 'electronica'),
    Producto(id:'4', nombre:'Mouse inalámbrico',       ubicacion:'192.1.1.5',  cantidad:15,   proveedor:'ClickPoint',     categoria:'Juguetes',         enPromocion:false, departamento: 'electronica'),
  ];

  bool _modoGrid = false;   // false = lista, true = cuadrícula

  void _toggleFavorito(int i) =>
      setState(() => _productos[i].favorito = !_productos[i].favorito);

  void _eliminar(int i) => setState(() => _productos.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Productos (${_productos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrícula
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _productos.length,
              itemBuilder: (ctx, i) => TarjetaProductoGrid(
                producto:   _productos[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _productos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaProducto(
                producto:   _productos[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}