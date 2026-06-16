import '../../../domain/entities/user_entity.dart';

abstract class AuthLocalDataSource {
  Future<bool> cacheToken(String token);

  Future<String> getToken();

  Future<void> removeToken();

  Future<bool> isLoggedIn();

}