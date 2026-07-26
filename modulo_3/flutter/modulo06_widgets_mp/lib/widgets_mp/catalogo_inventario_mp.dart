import 'package:flutter/material.dart';

class CatalogoInventario extends StatelessWidget {
  const CatalogoInventario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'Producto A101: Disponible',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
              decoration: TextDecoration.underline,
            ),
          ),

          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ───────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'almacen-central-bodega-principal-zona-norte-estanteria-A101 sin actualizar el conteo desde hace varios minutos, se recomienda revisar el inventario físico y actualizar el sistema.',
              textAlign: TextAlign.justify,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.fade,
            ),
          ),

          const SizedBox(height: 8),

          // ── Text.rich ─────────────────────────────────────────────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'AGOTADO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — última actualización hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── SelectableText ────────────────────────────────────────────────────
          const SelectableText(
            'SKU-0012-BODEGA',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              decoration: TextDecoration.lineThrough,
            ),
          ),

          const Divider(height: 32),

          // ── TÍTULOS ───────────────────────────────────────────────────────────
          const Text(
            'Cuatro variantes de botones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Botones con íconos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Botón personalizado',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Desactivado'),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Reabastecer'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.remove_shopping_cart, size: 18),
                label: const Text('Retirar'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info, size: 18),
                label: const Text('Información'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Exportar'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
                tooltip: 'Configura las reglas del inventario',
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ── Botón personalizado ───────────────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 12,
            ),
            child: const Text(
              'Marcar agotado',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(height: 32),

          // Agrega a children: [ ... ]
          // ── Cards y ListTile ──────────────────────────────────────────────────
          Card(
            elevation: 12, // antes 3
            color: Colors.red.shade50,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              leading: const Icon(Icons.inventory_2, color: Colors.indigo),
              title: const Text('Audífonos inalámbricos A101'),
              subtitle: const Text(
                'Estante A-12 · 120 unidades. Producto principal de la categoría electrónicos, con reposición automática configurada desde bodega central.',
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap: () {},
            ),
          ),

          Card(
            elevation: 3,
            color: Colors.red.shade50,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title: const Text('Cargador USB-C B203'),
              subtitle: const Text(
                'Agotado · Estante B-04. El producto no registra unidades disponibles y requiere reabastecimiento inmediato.',
              ),
              isThreeLine: true,
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),

          const SizedBox(height: 12),

          // ── Card con SwitchListTile ───────────────────────────────────────────
          Card(
            elevation: 3,
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Bloqueo de ventas'),
              subtitle: const Text(
                'Activa o desactiva la venta temporal de este producto.',
              ),
              secondary: const Icon(Icons.build),
            ),
          ),

          const Divider(height: 32),

          // Agrega a children: [ ... ]
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('Electrónica')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Disponible'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Disponible'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(label: Text('Ropa')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Disponible'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(label: Text('Hogar')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Disponible'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(label: Text('Alimentos')),
              FilterChip(
                label: const Text('Promoción'),
                selected: false,
                onSelected: (_) {},
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () {},
                padding: const EdgeInsets.all(8),
              ),
              ActionChip(
                label: const Text('Ver historial'),
                avatar: const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]

          // ── Circular ──────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(),

              ), // value: null → animación continua
              SizedBox(
                width: 48,
                height: 48,

                child: CircularProgressIndicator(
                  value: null, // 70 %
                  color: Colors.green,
                  strokeWidth: 6,
                  backgroundColor: const Color(0xFFEEEEEE),
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round, // puntas redondeadas
                  backgroundColor: const Color(0xFFEEEEEE),
                ),
              ),

            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal ────────────────────────────────────────────────────────────
          const LinearProgressIndicator(), // indeterminado
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 0.6,
            color: Colors.indigo,
          ), // 60 %
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 1.0,
            color: Colors.green,
            minHeight: 12, // barra más gruesa (default: 4)
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}