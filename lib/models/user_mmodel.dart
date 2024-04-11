class UserModal {
  String id;
  String name;
  String email;

  UserModal({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModal.fromMap({required Map data}) {
    return UserModal(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> get toMap {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
