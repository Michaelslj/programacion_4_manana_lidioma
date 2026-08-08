// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/producto_ssh_mp.dart';
import 'package:modulo09_formularios_mp/screens/pantalla_busqueda_mp.dart';
import 'package:modulo09_formularios_mp/screens/pantalla_productos_mp.dart';
import 'package:modulo09_formularios_mp/widgets/fila_servidor_mp.dart';
import 'package:modulo09_formularios_mp/widgets/formulario_servidor_mp.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  TextField + TextEditingController + FocusNode       │
// │  2  Paso 2  Form + TextFormField + validación                   │
// │  3  Paso 3  Modelo + ListView.builder + ListTile acciones       │
// │  4  Paso 4  GridView.builder + toggle lista/grid                │
// │  5  Paso 5  SearchBar + filtrado en tiempo real                 │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaProductos(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — vive en main.dart ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlNombre    = TextEditingController();
  final _ctrlUbicacion = TextEditingController();
  final _ctrlCantidad  = TextEditingController(text: '1');
  final _focusUbicacion = FocusNode();
  final _focusCantidad  = FocusNode();

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlUbicacion.dispose();
    _ctrlCantidad.dispose();
    _focusUbicacion.dispose();
    _focusCantidad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Registrar producto (rápido)'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlNombre,
              decoration:      const InputDecoration(
                labelText:  'Nombre del producto',
                hintText:   'Audífonos inalámbricos',
                prefixIcon: Icon(Icons.inventory_2),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusUbicacion.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlUbicacion,
              focusNode:       _focusUbicacion,
              decoration:      const InputDecoration(
                labelText:  'Ubicación en bodega',
                hintText:   '12.3.5.1',
                prefixIcon: Icon(Icons.location_on),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusCantidad.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlCantidad,
              focusNode:   _focusCantidad,
              decoration:  const InputDecoration(
                labelText:  'Cantidad en stock',
                prefixIcon: Icon(Icons.numbers),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Producto registrado: ${_ctrlNombre.text} '
                      '(${_ctrlUbicacion.text} x${_ctrlCantidad.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.save),
              label: const Text('Guardar rápido'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlNombre.clear();
                _ctrlUbicacion.clear();
                _ctrlCantidad.text = '1';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}
class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo producto'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioProducto(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['nombre']} — ${datos['ubicacion']} x${datos['cantidad']}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _productos = [
    Producto(id:'1', nombre:'Audífonos inalámbricos', ubicacion:'10.2.1.10',   cantidad:22,   proveedor:'TechSound SA',   categoria:'Electrónica',      enPromocion:true,  favorito:true, departamento: 'electronica'),
    Producto(id:'2', nombre:'Cargador USB-C',          ubicacion:'10.2.2.20',  cantidad:22,   proveedor:'PowerCell Corp', categoria:'Ropa',             enPromocion:true, departamento: 'alimentos'),
    Producto(id:'3', nombre:'Teclado mecánico',        ubicacion:'10.3.1.10',  cantidad:5,    proveedor:'KeyTech',        categoria:'Electrónica',      enPromocion:false, departamento: 'ropa'),
    Producto(id:'4', nombre:'Mouse inalámbrico',       ubicacion:'192.1.1.5',  cantidad:15,   proveedor:'ClickPoint',     categoria:'Juguetes',         enPromocion:false, departamento: 'hogar'),
    Producto(id: '5', nombre: 'Monitor 24 pulgadas', ubicacion: '192.1.1.100', cantidad: 22, proveedor: 'VisionTech', categoria: 'Alimentos', enPromocion: true, departamento: 'electronica')
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Productos (${_productos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _productos.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.inventory_2_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin productos',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _productos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaProducto(
                producto:   _productos[i],
                onFavorito: () => setState(() =>
                    _productos[i].favorito = !_productos[i].favorito),
                onEliminar: () => setState(() => _productos.removeAt(i)),
              ),
            ),
    );
  }
}