import 'package:fire_chat/core/utils/auth_service.dart';
import 'package:fire_chat/features/home/domain/use_cases/use_cases.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetHomeUseCase getHomeUseCase;

  HomeController({required this.getHomeUseCase});

  Future<void> logout() async {
    final auth = AuthService();
    await auth.signOut();
    // Get.offAll(() => const LoginScreen());
  }

  void navigateToChatScreen(dynamic userData) {
    // return () => Get.to(() => const ChatScreen());
  }
}
