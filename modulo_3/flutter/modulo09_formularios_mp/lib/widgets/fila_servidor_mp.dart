// lib/widgets/fila_producto.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/producto_ssh_mp.dart';

class FilaProducto extends StatelessWidget {
  final Producto     producto;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaProducto({
    super.key,
    required this.producto,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      // leading — icono con color según promoción
      leading: CircleAvatar(
        backgroundColor: producto.enPromocion
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.inventory_2,
          color: producto.enPromocion ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        producto.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${producto.proveedor} · ${producto.ubicacion} · ${producto.cantidad} u. (${producto.departamento})',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      // trailing — dos acciones compactas
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              producto.favorito ? Icons.star : Icons.star_border,
              color: producto.favorito ? Colors.amber : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:       producto.favorito ? 'Quitar favorito' : 'Agregar a favoritos',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}