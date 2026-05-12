import 'package:iquiz/src/features/auth/domain/entities/user.dart';

class UserTable {
  final num id;
  final String fullName;
  final String email;
  final String password;

  const UserTable({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory UserTable.fromModel(User user) => UserTable(
    id: user.id,
    fullName: user.fullName,
    email: user.email,
    password: user.password,
  );

  factory UserTable.fromMap(Map<String, dynamic> map) => UserTable(
    id: map['id'],
    fullName: map['full_name'],
    email: map['email'],
    password: map['password'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_name': fullName,
    'email': email,
    'password': password,
  };

  User toEntity() {
    return User(id: id, fullName: fullName, email: email, password: password);
  }
}
