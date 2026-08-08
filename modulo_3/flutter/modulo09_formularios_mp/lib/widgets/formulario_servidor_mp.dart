// lib/widgets/formulario_producto.dart
import 'package:flutter/material.dart';

class FormularioProducto extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioProducto({super.key, required this.onGuardar});

  @override
  State<FormularioProducto> createState() => _FormularioProductoState();
}

class _FormularioProductoState extends State<FormularioProducto> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlNombre    = TextEditingController();
  final _ctrlUbicacion = TextEditingController();
  final _ctrlCantidad  = TextEditingController(text: '1');
  final _ctrlProveedor = TextEditingController(text: 'Proveedor Principal');

  final _focusUbicacion = FocusNode();
  final _focusCantidad  = FocusNode();
  final _focusProveedor = FocusNode();

  String _categoria    = 'Electrónica';
  bool   _enPromocion = true;

  // Expresión regular para validar el código de ubicación (bodega.pasillo.estante.nivel)
  static final _regexUbicacion = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlUbicacion.dispose();
    _ctrlCantidad.dispose();
    _ctrlProveedor.dispose();
    _focusUbicacion.dispose();
    _focusCantidad.dispose();
    _focusProveedor.dispose();
    super.dispose();
  }

  void _guardar() {
    // validate() llama al validator de TODOS los TextFormField del Form
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':      _ctrlNombre.text,
      'ubicacion':   _ctrlUbicacion.text,
      'cantidad':    _ctrlCantidad.text,
      'proveedor':   _ctrlProveedor.text,
      'categoria':   _categoria,
      'enPromocion': _enPromocion.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // ── Nombre del producto ───────────────────────────────────
          TextFormField(
            controller:      _ctrlNombre,
            decoration:      const InputDecoration(
              labelText:  'Nombre del producto',
              hintText:   'Audífonos inalámbricos',
              prefixIcon: Icon(Icons.inventory_2),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusUbicacion.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3)                  return 'Mínimo 3 caracteres';
              if (!RegExp(r'^[a-zA-Z0-9\-\_ ]+$').hasMatch(v))
                return 'Solo letras, números, guiones y guiones bajos';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Ubicación en bodega ───────────────────────────────────
          TextFormField(
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
            onFieldSubmitted: (_) => _focusCantidad.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La ubicación es obligatoria';
              if (!_regexUbicacion.hasMatch(v)) return 'Formato inválido (ej. 12.3.5.1)';
              final partes = v.split('.').map(int.parse).toList();
              if (partes.any((o) => o > 255)) return 'Valor fuera de rango (0–255)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Cantidad en stock ─────────────────────────────────────
          TextFormField(
            controller:      _ctrlCantidad,
            focusNode:       _focusCantidad,
            decoration:      const InputDecoration(
              labelText:  'Cantidad en stock',
              prefixIcon: Icon(Icons.numbers),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusProveedor.requestFocus(),
            validator: (v) {
              final cantidad = int.tryParse(v ?? '');
              if (cantidad == null)                 return 'La cantidad debe ser un número';
              if (cantidad < 1 || cantidad > 65535) return 'Cantidad entre 1 y 65535';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Proveedor ─────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlProveedor,
            focusNode:       _focusProveedor,
            decoration:      const InputDecoration(
              labelText:  'Proveedor',
              prefixIcon: Icon(Icons.store_outlined),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El proveedor es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Categoría — DropdownButtonFormField ───────────────────
          DropdownButtonFormField<String>(
            value:      _categoria,
            decoration: const InputDecoration(
              labelText:  'Categoría',
              prefixIcon: Icon(Icons.category),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Electrónica', 'Ropa', 'Hogar y cocina',
              'Alimentos', 'Juguetes',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _categoria = v!),
          ),
          const SizedBox(height: 8),

          // ── Promoción — SwitchListTile ────────────────────────────
          SwitchListTile(
            title:     const Text('En promoción'),
            subtitle:  const Text('Aplica descuento especial'),
            value:     _enPromocion,
            onChanged: (v) => setState(() => _enPromocion = v),
            secondary: const Icon(Icons.local_offer),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar producto'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}