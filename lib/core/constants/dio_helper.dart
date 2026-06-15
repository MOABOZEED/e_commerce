import 'package:dio/dio.dart';

import 'api_constants.dart';

class DioHelper {

  static final Dio dio = Dio(
  BaseOptions(
  baseUrl: ApiConstant.baseUrl,
  receiveDataWhenStatusError: true,
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
  ),
  );

}