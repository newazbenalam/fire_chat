/*
@ Author: Newaz Ben Alam
@ Email:  newazbenalam@gmail.com
@ GitHub: github.com/newazbenalam
@ License: MIT
*/

import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/core/initilization.dart';
import 'package:fire_chat/features/home/presentation/screens/home_screen.dart';
import 'package:fire_chat/features/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  coreInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomeScreen(title: 'Fire Chat'),
      home: const LoginScreen(),
    );
  }
}
