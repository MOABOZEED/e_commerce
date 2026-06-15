import 'package:dio/dio.dart';

import '../../../../../core/entities/message_entity.dart';

import '../../../../../core/errors/exeptions.dart';
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

        await authLocalDataSource.cacheToken(authModel.token);

        return authModel;
      }

      throw ServerException(errorMassageModel: response.data['message']);
    } on DioException catch (e) {
      throw ServerException(
        errorMassageModel: e.response?.data['message'] ?? 'Login failed',
      );
    }
  }

  @override
  Future<MessageEntity> register(RegisterParams params) async {
    try {
      final response = await dio.post(
        '/api/auth/register',
        data: {
          "name": params.name,
          "email": params.email,
          "password": params.password,
          "password_confirmation": params.passwordConfirmation,
        },
      );

      if (response.statusCode == 200 ) {
        return MessageEntity(message: response.data['message']);
      }

      throw ServerException(errorMassageModel: response.data['message']);
    } on DioException catch (e) {
      throw ServerException(
        errorMassageModel: e.response?.data['message'] ?? 'Register failed',
      );
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await authLocalDataSource.removeToken();
    } catch (_) {
      throw CacheException();
    }
  }
}
