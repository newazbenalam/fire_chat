import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/login/presentation/getx/login_controller.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        obscureText: true,
        controller: controller.passwordController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter password.';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: primaryColorLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: primaryColor),
          ),
          fillColor: backgroundColor,
          filled: true,
          labelText: "Password",
        ),
      ),
    );
  }
}

class EmailForm extends StatelessWidget {
  const EmailForm({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter email.';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: primaryColorLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: primaryColor),
          ),
          fillColor: backgroundColor,
          filled: true,
          labelText: "Email",
        ),
      ),
    );
  }
}
