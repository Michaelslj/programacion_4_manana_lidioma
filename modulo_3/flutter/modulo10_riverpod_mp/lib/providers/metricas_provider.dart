// lib/providers/metricas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_producto.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaProducto>> {
  // build() puede ser async — es la carga inicial
  @override
  Future<List<MetricaProducto>> build() => _fetch();

  Future<List<MetricaProducto>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaProducto(producto:'Audífonos inalámbricos', ocupacion:45.2, mermas:62.1, movimientos:230, precision:80.5),
      MetricaProducto(producto:'Cargador USB-C',          ocupacion:88.1, mermas:91.2, movimientos:80,  precision:95.0),
      MetricaProducto(producto:'Teclado mecánico',        ocupacion:22.4, mermas:41.0, movimientos:50,  precision:60.0),
      MetricaProducto(producto:'Mouse inalámbrico',       ocupacion:12.0, mermas:30.5, movimientos:20,  precision:75.0),
      MetricaProducto(producto:'Monitor 24 pulgadas',     ocupacion:12.0, mermas:30.5, movimientos:20,  precision:75.0),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasProvider =
    AsyncNotifierProvider<MetricasNotifier, List<MetricaProducto>>(
  MetricasNotifier.new,
);