class TodoDtoUser {
  final int id;
  final String username;
  final String email;

  const TodoDtoUser({
    required this.id,
    required this.username,
    required this.email,
  });

  factory TodoDtoUser.fromJson(Map<String, dynamic> json) => TodoDtoUser(
        id: json['id'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
      );
}
