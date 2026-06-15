import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/exeptions.dart';
import 'auth_local_data_source.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const cachedToken = 'CACHED_TOKEN';

  const AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> cacheToken(String token) async {
    final result = await sharedPreferences.setString(cachedToken, token);

    if (!result) {
      throw CacheException();
    }

    return result;
  }

  @override
  Future<String> getToken() async {
    final token = sharedPreferences.getString(cachedToken);

    if (token == null) {
      throw CacheException();
    }

    return token;
  }

  @override
  Future<bool> removeToken() async {
    final result = await sharedPreferences.remove(cachedToken);

    if (!result) {
      throw CacheException();
    }

    return result;
  }
}
