// Export files for the entities of homescreen
import 'package:fire_chat/core/utils/auth_service.dart';

abstract class ChatServicesEntity {
  Stream<List<Map<String, dynamic>>> getUsersStream();
}

abstract class AuthServiceEntity extends AuthService {}
