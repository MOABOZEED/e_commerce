import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:ecommerce/features/auth/domain/entities/login_params.dart';
import 'package:ecommerce/features/auth/domain/entities/register_params.dart';

import '../../../../core/entities/message_entity.dart';
import '../../../../core/errors/exeptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/remote/auth_remote_datasource.dart';
import '../models/request/login_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  const AuthRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, AuthEntity>> login(LoginParams loginParams) async {
    try {
      final result = await remote.login(
        LoginRequest(email: loginParams.email, password: loginParams.password),
      );

      return Right(result);



    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMassageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> register(RegisterParams params) async {
    try {
      final message = await remote.register(params);

      return Right(message);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMassageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remote.logout();

      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMassageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    return Left(ServerFailure(' not implemented yet'));
  }
}
