import 'package:fire_chat/core/init_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> coreInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    init(),
  ]);
}
