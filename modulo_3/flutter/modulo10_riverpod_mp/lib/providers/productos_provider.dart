// lib/providers/productos_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/producto.dart';

// NotifierProvider — estado complejo con métodos propios
class ProductosNotifier extends Notifier<List<Producto>> {
  @override
  List<Producto> build() => [
    Producto(id:'1', nombre:'Audífonos inalámbricos', ubicacion:'10.2.1.10', cantidad:22,   enPromocion:true,  favorito:true),
    Producto(id:'2', nombre:'Cargador USB-C',          ubicacion:'10.2.2.20', cantidad:22,   enPromocion:true),
    Producto(id:'3', nombre:'Teclado mecánico',        ubicacion:'10.3.1.10', cantidad:2222, enPromocion:false),
    Producto(id:'4', nombre:'Mouse inalámbrico',       ubicacion:'10.3.1.10', cantidad:5432, enPromocion:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((p) =>
        p.id == id
          ? Producto(id:p.id, nombre:p.nombre, ubicacion:p.ubicacion,
                        cantidad:p.cantidad, enPromocion:p.enPromocion,
                        favorito:!p.favorito)
          : p
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((p) => p.id != id).toList();
  }

  void agregar(Producto producto) {
    state = [...state, producto];
  }
}

final productosProvider =
    NotifierProvider<ProductosNotifier, List<Producto>>(
  ProductosNotifier.new,
);
// Filtro de búsqueda — estado primitivo
final busquedaProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO — se recalcula cuando cualquiera de sus dependencias cambia
final productosFiltradosProvider = Provider<List<Producto>>((ref) {
  final todos    = ref.watch(productosProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((p) =>
      p.nombre.toLowerCase().contains(q) || p.ubicacion.contains(q)
  ).toList();
  // Cuando 'productosProvider' o 'busquedaProvider' cambian,
  // este provider se recalcula automáticamente.
});