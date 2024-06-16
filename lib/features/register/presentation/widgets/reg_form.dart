import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/register/presentation/getx/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormCustomPass extends StatelessWidget {
  const TextFormCustomPass({
    super.key,
    required this.controller,
    required this.title,
    this.isPassword = false,
    required this.hint,
  });
  final bool isPassword;
  final String title;
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        validator: (value) {
          if (registerController.passwordController.text !=
              registerController.repeatPasswordController.text) {
            return hint;
          }
          return null;
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: primaryColorLight),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: primaryColor),
          ),
          fillColor: backgroundColor,
          filled: true,
          labelText: title,
        ),
      ),
    );
  }
}
