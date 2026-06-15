import 'package:dart_either/dart_either.dart';

import '../../../../core/entities/message_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/register_params.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  const RegisterUseCase(this.repository);

  Future<Either<Failure, MessageEntity>> call(
      RegisterParams params,
      ) {
    return repository.register(params);
  }
}