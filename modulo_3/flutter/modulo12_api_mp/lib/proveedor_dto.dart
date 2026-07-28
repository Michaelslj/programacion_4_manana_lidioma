class ProveedorDto {
  final int id;
  final String nombreProveedor;   // JSON key: username
  final String correo;            // JSON key: email

  const ProveedorDto({
    required this.id,
    required this.nombreProveedor,
    required this.correo,
  });

  factory ProveedorDto.fromJson(Map<String, dynamic> json) => ProveedorDto(
        id: json['id'] as int,
        nombreProveedor: json['username'] as String,
        correo: json['email'] as String,
      );
}