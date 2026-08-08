import 'package:flutter/material.dart';

class ContadorStock extends StatefulWidget {
  final String producto;
  final int stockMaximo;
  final Color color;
  final VoidCallback? onStockLleno;

  final String textoBoton;

  final int pasoIncremento;

  const ContadorStock({
    super.key,
    required this.producto,

    this.stockMaximo = 1,

    this.color = Colors.deepPurple,

    this.onStockLleno,

    this.textoBoton = 'Agregar',
    this.pasoIncremento = 1,
  });

  @override
  State<ContadorStock> createState() => _ContadorStockState();
}

class _ContadorStockState extends State<ContadorStock> {
  int _unidades = 0;

  void _agregarUnidad() {
    if (_unidades >= widget.stockMaximo) return;

    setState(() {
      _unidades += widget.pasoIncremento;
    });

    if (_unidades >= widget.stockMaximo) {
      widget.onStockLleno?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _unidades >= widget.stockMaximo;
    final progreso = (_unidades / widget.stockMaximo).clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.producto,
          style: TextStyle(color: widget.color, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 4),

        LinearProgressIndicator(
          value: progreso,
          color: widget.color,
          backgroundColor: widget.color.withOpacity(0.15),
        ),

        const SizedBox(height: 4),

        Text(
          '$_unidades / ${widget.stockMaximo}',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: widget.color,
          ),
        ),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: enLimite ? null : _agregarUnidad,
              child: Text(widget.textoBoton),
            ),

            const SizedBox(width: 8),

            TextButton(
              onPressed: () => setState(() => _unidades = 0),
              child: const Text('Vaciar'),
            ),
          ],
        ),

        if (enLimite)
          Text(
            'Stock máximo alcanzado',
            style: TextStyle(fontSize: 12, color: widget.color),
          ),
      ],
    );
  }
}