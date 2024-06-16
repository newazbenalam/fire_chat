// Main screen for settings feature

import 'package:fire_chat/core/app_constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String title;
  const SettingsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
          ],
        ),
      ),
    );
  }
}
