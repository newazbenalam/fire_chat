/*
@ Author: Newaz Ben Alam
@ Email:  newazbenalam@gmail.com
@ GitHub: github.com/newazbenalam
@ License: MIT
*/

import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/register/presentation/getx/register_controller.dart';
import 'package:fire_chat/features/register/presentation/widgets/reg_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logo1,
                  height: 200,
                ),
                const Center(
                  child: Column(
                    children: [
                      Text('Create your account'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormCustom(
                  controller: controller.emailController,
                  title: "Email",
                  isPassword: false,
                  hint: "Email is required",
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormCustomPass(
                  controller: controller.passwordController,
                  title: "Password",
                  isPassword: true,
                  hint: "Password does not match",
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormCustomPass(
                  controller: controller.repeatPasswordController,
                  title: "Confirm Password",
                  isPassword: true,
                  hint: "Password does not match",
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          controller.passwordController.text ==
                              controller.repeatPasswordController.text) {
                        controller.onRegisterButtonPressed();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        color: secondaryTextColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormCustom extends StatelessWidget {
  const TextFormCustom({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
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
