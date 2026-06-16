import '../../../../../core/entities/message_entity.dart';
import '../../../domain/entities/register_params.dart';
import '../../models/auth_model.dart';
import '../../models/request/login_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(LoginRequest request);

  Future<MessageEntity> register(RegisterParams params);

  Future<void> logout();
}
