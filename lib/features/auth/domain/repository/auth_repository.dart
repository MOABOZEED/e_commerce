import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/features/auth/domain/entities/auth_entity.dart';

import '../../../../core/entities/message_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/register_params.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login({
    required String email,

    required String password,

    // required String role,
  });

  Future<Either<Failure, MessageEntity>> register(
      RegisterParams params,
      );


  // Future<Either<Failure, void>> register({
  //   required String name,
  //
  //   required String email,
  //
  //   required String password,
  // });

  // Future<bool> isLoggedIn();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserEntity>> getCurrentUser();
}
