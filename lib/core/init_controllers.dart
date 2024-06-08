import 'package:fire_chat/features/login/presentation/getx/login_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // Get.put(HomeScreenController());
  Get.lazyPut(() => LoginController());
}
