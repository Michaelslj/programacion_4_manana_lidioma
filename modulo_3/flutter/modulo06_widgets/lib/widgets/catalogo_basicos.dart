import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'nginx-proxy: En línea',
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
              'api-gateway-produccion-region-us-east-servidor-principal-balanceador-de-carga sin respuesta desde hace varios minutos, se recomienda revisar la conectividad y el estado de los servicios asociados.',
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
                  text: 'CRÍTICO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — última revisión hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── SelectableText ────────────────────────────────────────────────────
          const SelectableText(
            '10.0.0.12:5432',
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
                label: const Text('Reiniciar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info, size: 18),
                label: const Text('Información'),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Descargar'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
                tooltip: 'Detiene todos los servicios',
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
              'Acción crítica',
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
              leading: const Icon(Icons.dns, color: Colors.indigo),
              title: const Text('nginx-proxy'),
              subtitle: const Text(
                '10.0.0.5 · 45ms. Servicio principal encargado del balanceo de carga y la distribución de peticiones entre los diferentes servidores de la infraestructura.',
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
              title: const Text('backup-worker'),
              subtitle: const Text(
                'Sin respuesta · 10.0.0.30. El servicio de respaldo no ha respondido durante los últimos minutos y requiere revisión inmediata.',
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
              title: const Text('Modo mantenimiento'),
              subtitle: const Text(
                'Activa o desactiva el mantenimiento del sistema.',
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
              const Chip(label: Text('nginx')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(label: Text('python')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(label: Text('C++')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const Chip(label: Text('c#')),
              FilterChip(
                label: const Text('HTTP/2'),
                selected: false,
                onSelected: (_) {},
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () {},
                padding: const EdgeInsets.all(8),
              ),
              ActionChip(
                label: const Text('Ver logs'),
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
                  backgroundColor: Colors.grey.shade200,
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
                  backgroundColor: Colors.grey.shade200,
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
