import 'package:equatable/equatable.dart';

import '../../../../core/entities/message_entity.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final AuthEntity auth;

  const LoginSuccess(this.auth);

  @override
  List<Object?> get props => [auth];
}

class RegisterSuccess extends AuthState {
  final MessageEntity message;

  const RegisterSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class LogoutSuccess extends AuthState {}

/// ======================
/// CURRENT USER SUCCESS
/// ======================

class CurrentUserSuccess extends AuthState {
  // final String name;
  final UserEntity user;

  const CurrentUserSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
