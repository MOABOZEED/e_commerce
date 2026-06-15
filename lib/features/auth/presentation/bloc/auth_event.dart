import 'package:equatable/equatable.dart';

import '../../domain/entities/register_params.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends AuthEvent {
  final String email;

  final String password;

  const UserLoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final RegisterParams params;

  const RegisterEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class GetCurrentUserEvent extends AuthEvent {
  const GetCurrentUserEvent();
}
