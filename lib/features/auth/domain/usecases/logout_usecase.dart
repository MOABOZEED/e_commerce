import 'package:dart_either/dart_either.dart';

import '../../../../core/errors/failures.dart';
import '../repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase(this.authRepository);

  Future<Either<Failure, void>> execute() async {
    return await authRepository.logout();
  }
}
