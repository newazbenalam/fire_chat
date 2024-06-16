import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/login/presentation/getx/login_controller.dart';
import 'package:fire_chat/features/register/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const RegisterScreen(),
              transition: Transition.rightToLeftWithFade);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: const Text('Register'),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await controller.onLoginButtonPressed();
          }
        },
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
