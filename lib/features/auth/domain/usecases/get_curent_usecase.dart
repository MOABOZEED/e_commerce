import 'package:dart_either/dart_either.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

import '../repository/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository authRepository;

  GetCurrentUserUseCase(this.authRepository);

  Future<Either<Failure, UserEntity>> call() async {
    return await authRepository.getCurrentUser();
  }
}
