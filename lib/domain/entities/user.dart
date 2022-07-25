class User {
  final int id;
  final String fullName, email, image;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.image,
  });

  factory User.fromResponse(Map<String, dynamic> response) {
    final firstName = response['first_name'] ?? '';
    final lastName = response['last_name'] ?? '';
    final fullName = '$firstName $lastName';
    final email = response['email'] ?? '';
    final image = response['avatar'] ?? '';
    final id = response['id'] ?? 0;

    return User(id: id, fullName: fullName, email: email, image: image);
  }
}
