import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/features/auth/domain/entities/login_params.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_entity.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<Failure, AuthEntity>> call(LoginParams loginParams) async {
    return authRepository.login(loginParams);

  }
}
