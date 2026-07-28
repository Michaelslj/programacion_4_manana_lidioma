class TareaInventarioDto {
  final int id;
  final String descripcion;   // JSON key: title
  final bool revisada;        // JSON key: completed

  const TareaInventarioDto({
    required this.id,
    required this.descripcion,
    required this.revisada,
  });

  factory TareaInventarioDto.fromJson(Map<String, dynamic> json) => TareaInventarioDto(
    id:          json['id']        as int,
    descripcion: json['title']     as String,
    revisada:    json['completed'] as bool,
  );
}