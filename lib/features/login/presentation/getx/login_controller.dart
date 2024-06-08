import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxBool buttonDisabled = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void onLoginButtonPressed() {
    debugPrint('Email: ${emailController.text}');
    debugPrint('Password: ${passwordController.text}');
  }
}
