import '../network/error_messge.dart';

class ServerException implements Exception {
  final ErrorMassageModel errorMassageModel;

  const ServerException({required this.errorMassageModel});
}

class CacheException implements Exception {}

class SocketException implements Exception {}
