import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/login/presentation/getx/login_controller.dart';
import 'package:flutter/material.dart';

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
          if (formKey.currentState!.validate()) {
            controller.onLoginButtonPressed();
          }
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
        onPressed: () {
          if (formKey.currentState!.validate()) {
            controller.onLoginButtonPressed();
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
