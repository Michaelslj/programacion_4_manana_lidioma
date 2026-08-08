// lib/widgets/tarjeta_producto_grid.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp/models/producto_ssh_mp.dart';

class TarjetaProductoGrid extends StatelessWidget {
  final Producto producto;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaProductoGrid({
    super.key,
    required this.producto,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila superior: icono + favorito
            Row(children: [
              Icon(
                Icons.inventory_2,
                color: producto.enPromocion ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  producto.favorito ? Icons.star : Icons.star_border,
                  color: producto.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),

            // Nombre y ubicación
            Text(
              producto.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              producto.ubicacion,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),


            const Spacer(),

            // Fila inferior: promoción + categoría + eliminar
            Row(children: [
              if (producto.enPromocion)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.local_offer, size: 12, color: cs.primary),
                ),
              Expanded(
                child: Text(
                  producto.categoria,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}