import 'package:flutter/material.dart';

class EtiquetaProducto extends StatelessWidget {
  final String texto;
  final Color color;
  final double fontSize; // parámetro con valor por defecto
  final bool relleno; // controla si el fondo tiene opacidad alta

  const EtiquetaProducto({
    super.key,
    required this.texto,
    required this.color,
    this.fontSize = 13, // opcional — no necesita required
    this.relleno = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(relleno ? 0.3 : 0.12),
        border: Border.all(color: color, width: 1.5),
        //borderRadius: BorderRadius.circular(4),

        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: Text(
        texto,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      ),
    );
  }
}