import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;

  // final String token;

  const UserEntity({
    required this.name,
    required this.email,
    required this.id,
    required this.role,
    // required this.password,
    // required this.token,
  });

  @override
  List<Object> get props => [name, email, role, id];
}
