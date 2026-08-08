// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo07_layouts_mp/widgets_mp/avatar_badge_mp.dart';
import 'package:modulo07_layouts_mp/widgets_mp/fila_estado_mp.dart';
import 'package:modulo07_layouts_mp/widgets_mp/tarjeta_log_mp.dart';
// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoración y espaciado                  │
// │  2  Paso 2  Column — TarjetaLog                                 │
// │  3  Paso 3  Row + Expanded + Spacer — FilaEstado                │
// │  4  Paso 4  Stack + Positioned — AvatarBadge                   │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 1;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
      body: ListView(
        children: [
          TarjetaLog(nivel: 'ERROR', componente: 'ventas-service',
              mensaje:   'Stock insuficiente — venta rechazada para SKU-0012',
              timestamp: DateTime.now()),
          TarjetaLog(nivel: 'WARN',  componente: 'inventario-service',
              mensaje:   'Unidades disponibles: 2 / 10 en Bodega Norte',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaLog(nivel: 'INFO',  componente: 'reabastecimiento',
              mensaje:   'Conteo físico de bodega completado',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaLog(nivel: 'DEBUG', componente: 'sync-service',
              mensaje:   'GET /api/inventario/estado → 200 OK (38ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => const Scaffold(
      body: Column(
        children: [
          FilaEstado(nombre: 'Audífonos inalámbricos', detalle: 'Bodega Norte · 45 unidades',        activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Cargador USB-C',          detalle: 'Bodega Sur · 8 unidades',           activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Teclado mecánico',        detalle: 'Bodega Sur · sin unidades',         activo: false),
          Divider(height: 1),
          FilaEstado(nombre: 'Monitor 24 pulgadas full hd produccion',
                     detalle: 'Bodega Central · 12 unidades', activo: true),
        ],
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadge(nombre: 'audifonos', alertas: 2,  activo: true, message: 'Producto estrella del catálogo'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'cargador',  alertas: 0,  activo: true, message: 'Accesorio de alta rotación'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'teclado', alertas: 0,  activo: false, message: 'Producto agotado en bodega'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'monitor',  alertas: 11, activo: true, message: 'Requiere reabastecimiento urgente'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Silla ergonómica',  alertas: 11, activo: true, message: 'Silla ergonómica'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Detalle: 12 unidades restantes',  alertas: 11, activo: false, message: 'Detalle del producto'),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'mouse',  alertas: 11, activo: true, message: 'Mouse inalámbrico'),
          ],
        ),
      ),
    ),
    5 => Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // SizedBox — espaciado fijo
          const Text('SizedBox', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Primer elemento'),
          const SizedBox(height: 32),          // ← espacio fijo de 32px
          const Text('Segundo elemento (después de 32px)'),

          const Divider(height: 32),

          // Padding — espacio alrededor de un hijo
          const Text('Padding', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            color: Colors.indigo.shade50,
            child: const Padding(
              padding: EdgeInsets.only(left: 24),    // ← sangría izquierda
              child:   Text('Texto con Padding izquierdo'),
            ),
          ),

          const Divider(height: 32),

          // Align — posicionar dentro del espacio disponible
          const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,        // ← borde derecho
            child: Icon(Icons.settings, color: Colors.indigo),
          ),

          const Divider(height: 32),

          // Wrap — flujo automático de elementos
          const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing:    8,
            runSpacing: 8,
            children: ['Electrónica', 'Disponible', 'Promoción', 'Nuevo', 'Alta rotación', 'Frágil', 'Importado']
                .map((t) => Chip(label: Text(t)))
                .toList(),
          ),
        ],
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — Container (vive aquí en main.dart) ─────────────────────
Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:   double.infinity,
      height:  80,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(40),
        border:       Border(left: BorderSide(color: Colors.indigo, width: 4)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Producto A101',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);