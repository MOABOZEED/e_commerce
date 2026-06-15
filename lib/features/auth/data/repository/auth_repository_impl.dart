
import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:ecommerce/features/auth/domain/entities/register_params.dart';

import '../../../../core/entities/message_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/remote/auth_remote_datasource.dart';
import '../models/request/login_request.dart';

class AuthRepositoryImpl
    implements AuthRepository {
  final AuthRemoteDataSource remote;

  const AuthRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await remote.login(
        LoginRequest(
          email: email,
          password: password,
        ),
      );

      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'] ??
              'Server Error',
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, MessageEntity>> register(
      RegisterParams params,
      ) async {
    try {
      final message = await remote.register(params);

      return Right(message);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}


// import 'package:dart_either/dart_either.dart';
//
// import '../../../../core/errors/failures.dart';
// import '../../domain/entities/user_entity.dart';
// import '../../domain/repository/auth_repository.dart';
// import '../datasource/auth_local_data_source.dart';
//
// class AuthRepositoryImpl implements AuthRepository {
//   final AuthLocalDataSource localDataSource;
//
//   const AuthRepositoryImpl(this.localDataSource);
//
//   @override
//   Future<Either<Failure, UserEntity>> login({
//     required String email,
//     required String password,
//     required String role,
//   }) async {
//     try {
//       final user = await localDataSource.login(
//         email: email,
//         password: password,
//         role: role,
//       );
//
//       return Right(user);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> register({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       await localDataSource.register(
//         name: name,
//         email: email,
//         password: password,
//       );
//
//       return const Right(null);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> logout() async {
//     try {
//       await localDataSource.logout();
//
//       return const Right(null);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, UserEntity>> getCurrentUser() async {
//     try {
//       final user = await localDataSource.getCurrentUser();
//
//       return Right(user);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
//
//   // @override
//   // Future<bool> isLoggedIn() {
//   //   return localDataSource.isLoggedIn();
//   // }
// }
