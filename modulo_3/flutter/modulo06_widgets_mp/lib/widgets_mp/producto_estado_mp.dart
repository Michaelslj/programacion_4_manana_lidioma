import 'package:flutter/material.dart';

class ProductoEstado extends StatefulWidget {
  final String nombre;

  const ProductoEstado({
    super.key,
    required this.nombre,
  });

  @override
  State<ProductoEstado> createState() => _ProductoEstadoState();
}

class _ProductoEstadoState extends State<ProductoEstado> {
  bool _disponible = true;
  int _reabastecimientos = 0;

  String _nivel = 'normal';

  static const int _maxReabastecimientos = 2;

  void _toggle() {
    setState(() {
      _disponible = !_disponible;

      if (_disponible) {
        _reabastecimientos++;

        if (_reabastecimientos == 1) {
          _nivel = 'warning';
        } else if (_reabastecimientos >= 2) {
          _nivel = 'critico';
        }
      }
    });
  }

  Color _colorNivel() {
    switch (_nivel) {
      case 'warning':
        return Colors.orange;
      case 'critico':
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  void _reiniciarTodo() {
    setState(() {
      _disponible = true;
      _reabastecimientos = 0;
      _nivel = 'normal';
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reabastecimientos >= _maxReabastecimientos;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ── Ícono con color según nivel ──────────────────────────
          Icon(
            _disponible ? Icons.inventory_2 : Icons.remove_shopping_cart,
            size: 72,
            color: _colorNivel(),
          ),

          const SizedBox(height: 8),

          Text(
            widget.nombre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Text(
            _disponible ? 'Disponible' : 'Agotado',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _disponible
                  ? Colors.green.shade700
                  : Colors.red.shade700,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'Nivel: $_nivel',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _colorNivel(),
            ),
          ),

          const SizedBox(height: 16),

          // ── Mensaje cuando está agotado ───────────────────────────
          if (!_disponible)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.red.shade300,
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber,
                    color: Colors.red,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Requiere atención',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

          // ── ElevatedButton.icon ──────────────────────────────────
          ElevatedButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(
              _disponible ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
            ),
            label: Text(
              _disponible
                  ? 'Marcar agotado'
                  : 'Reabastecer',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: _disponible
                  ? Colors.red.shade600
                  : Colors.green.shade600,
              foregroundColor: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          // ── Reiniciar todo ───────────────────────────────────────
          TextButton(
            onPressed: _reiniciarTodo,
            child: const Text('Reiniciar estado'),
          ),

          const SizedBox(height: 12),

          // ── Contador ─────────────────────────────────────────────
          Opacity(
            opacity: 1,
            child: Text(
              'Reabastecimientos: $_reabastecimientos / $_maxReabastecimientos',
              style: TextStyle(
                fontSize: 13,
                color: enLimite
                    ? Colors.red
                    : Colors.grey.shade600,
                fontStyle: _disponible
                    ? FontStyle.normal
                    : FontStyle.italic,
              ),
            ),
          ),

          // ── Límite alcanzado ─────────────────────────────────────
          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de reabastecimientos alcanzado',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}