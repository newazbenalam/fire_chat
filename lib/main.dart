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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await coreInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fire Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: backgroundPrimaryColor,
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return const HomeScreen(title: 'FireChat');
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
