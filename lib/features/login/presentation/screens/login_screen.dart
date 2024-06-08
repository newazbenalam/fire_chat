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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text('Login Screen'),
                ),
                const SizedBox(
                  height: 24,
                ),
                EmailForm(controller: controller),
                const SizedBox(
                  height: 24,
                ),
                PasswordForm(controller: controller),
                const SizedBox(
                  height: 24,
                ),
                LoginButton(formKey: formKey, controller: controller),
                const SizedBox(
                  height: 24,
                ),
                RegisterButton(formKey: formKey, controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
