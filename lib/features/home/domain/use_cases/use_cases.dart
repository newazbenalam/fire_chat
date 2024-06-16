import 'package:fire_chat/features/home/domain/repositories/login_repository.dart';

class GetHomeUseCase {
  final HomeRepository homeRepository;

  GetHomeUseCase({required this.homeRepository});

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return homeRepository.getUsers();
  }
}
