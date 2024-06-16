/*
@ Author: Newaz Ben Alam
@ Email:  newazbenalam@gmail.com
@ GitHub: github.com/newazbenalam
@ License: MIT
*/

import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/login/presentation/getx/login_controller.dart';
import 'package:fire_chat/features/login/presentation/widgets/form_buttons.dart';
import 'package:fire_chat/features/login/presentation/widgets/login_forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
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
                      Text('Welcome back!'),
                      Text('Login to your account'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                EmailForm(controller: controller),
                const SizedBox(
                  height: 18,
                ),
                PasswordForm(controller: controller),
                const SizedBox(
                  height: 18,
                ),
                LoginButton(formKey: formKey, controller: controller),
                const SizedBox(
                  height: 18,
                ),
                RegisterButton(formKey: formKey, controller: controller),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    controller.onGoogleLoginButtonPressed();
                  },
                  child: Image.asset(
                    googlePurpleIcon,
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
