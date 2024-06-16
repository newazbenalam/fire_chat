import 'package:fire_chat/core/utils/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxBool buttonDisabled = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> onLoginButtonPressed() async {
    final AuthService authService = AuthService();
    Get.dialog(const Center(child: CircularProgressIndicator()));
    try {
      await authService.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      Get.back();
      await Get.dialog(
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
    } finally {
      Get.back();
      clearFields();
    }
  }

  void onGoogleLoginButtonPressed() {
    debugPrint('Google Login Button Pressed');
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }
}
