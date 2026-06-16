import 'package:dio/dio.dart';

import '../../../../../core/entities/message_entity.dart';

import '../../../../../core/errors/exeptions.dart';
import '../../../../../core/network/error_messge.dart';
import '../../models/auth_model.dart';
import '../../models/request/login_request.dart';

import '../../../domain/entities/register_params.dart';

import '../local/auth_local_data_source.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  final AuthLocalDataSource authLocalDataSource;

  const AuthRemoteDataSourceImpl({
    required this.dio,
    required this.authLocalDataSource,
  });


  @override
  Future<AuthModel> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        '/api/auth/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final authModel = AuthModel.fromJson(response.data);

        await authLocalDataSource.cacheToken(
          authModel.token,
        );

        return authModel;
      }

      throw ServerException(
        errorMassageModel: ErrorMassageModel.fromJson(
          response.data,
          statusCode: response.statusCode,
        ),
      );
    } on DioException catch (e) {
      throw ServerException(
        errorMassageModel: ErrorMassageModel.fromJson(
          e.response?.data,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }

  @override
  Future<MessageEntity> register(
      RegisterParams params,
      ) async {
    try {
      final response = await dio.post(
        '/api/auth/register',
        data: {
          "name": params.name,
          "email": params.email,
          "password": params.password,
          "password_confirmation":
          params.passwordConfirmation,
        },
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201) {
        return MessageEntity(
          message: response.data['message'] ??
              'Register Success',
        );
      }

      throw ServerException(
        errorMassageModel: ErrorMassageModel.fromJson(
          response.data,
          statusCode: response.statusCode,
        ),
      );
    } on DioException catch (e) {
      throw ServerException(
        errorMassageModel: ErrorMassageModel.fromJson(
          e.response?.data,
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      await authLocalDataSource.removeToken();
    } catch (_) {
      throw CacheException();
    }
  }
}
