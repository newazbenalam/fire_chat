import 'package:fire_chat/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final drawerElements = [
  {
    'title': 'Home',
    'icon': Icons.home,
    'route': () => Get.back(),
  },
  {
    'title': 'Profile',
    'icon': Icons.person,
    'route': () => Get.back(),
  },
  {
    'title': 'Settings',
    'icon': Icons.settings,
    'route': () => Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const SettingsScreen(title: 'Settings'),
          ),
        )
  },
];
