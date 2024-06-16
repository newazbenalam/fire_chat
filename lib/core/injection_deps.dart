import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:fire_chat/features/chat/domain/use_cases/chat_use_cases.dart';
import 'package:fire_chat/features/chat/presentation/controller/chat_controller.dart';
import 'package:fire_chat/features/home/data/data_sources/remote_data_source.dart';
import 'package:fire_chat/features/home/data/models/auth_service.dart';
import 'package:fire_chat/features/home/data/repositories/home_repository_impl.dart';
import 'package:fire_chat/features/home/domain/use_cases/use_cases.dart';
import 'package:fire_chat/features/home/presentation/controller/home_controller.dart';
import 'package:fire_chat/features/login/presentation/getx/login_controller.dart';
import 'package:fire_chat/features/register/presentation/getx/register_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => RegisterController());
  Get.put(HomeController(
      getHomeUseCase: GetHomeUseCase(
          homeRepository: HomeRepositoryImpl(
              chatServices: ChatServicesImp(), authServices: AuthService()))));
  Get.put(
    ChatController(
      chatUseCase: ChatUseCase(
        chatRepository: ChatRepositoryImpl(
            firestore: FirebaseFirestore.instance, auth: FirebaseAuth.instance),
      ),
    ),
  );
}
