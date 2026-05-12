import 'package:equatable/equatable.dart';

class User extends Equatable {
  final num id;
  final String fullName;
  final String email;
  final String password;

  const User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [id, fullName, email, password];
}
