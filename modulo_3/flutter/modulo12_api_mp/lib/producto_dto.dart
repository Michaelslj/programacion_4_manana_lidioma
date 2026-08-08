import 'producto.dart';

class ProductoDto {
  final int          id;
  final String       title;
  final double       price;
  final String       description;
  final String       category;
  final List<String> images;

  const ProductoDto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) => ProductoDto(
    id:          json['id']    as int,
    title:       json['title'] as String,
    price:       (json['price'] as num).toDouble(),
    description: json['description'] as String,
    category:    (json['category'] as Map<String, dynamic>)['name'] as String,
    images: (json['images'] as List<dynamic>)
        .map((e) => e.toString())
        .toList(),
  );

  // Convierte el DTO (forma cruda de la API) al modelo de dominio
  // que realmente usa la UI de la app.
  Producto toDomain() => Producto(
    id:        id,
    nombre:    title,
    precio:    price,
    categoria: category,
    imagenUrl: images.isNotEmpty ? images.first : '',
  );
}