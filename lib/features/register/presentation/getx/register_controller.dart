import 'package:fire_chat/core/utils/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  Future<void> onRegisterButtonPressed() async {
    final auth = AuthService();
    if (passwordController.text != repeatPasswordController.text) {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Passwords do not match'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
      return;
    }

    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.back();
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }
}
