// Export files for the bloc of chat
import 'package:fire_chat/features/chat/domain/use_cases/chat_use_cases.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ChatUseCase chatUseCase;
  ChatController({required this.chatUseCase});

  RxString receiverId = ''.obs;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> sendMessage(String message, dynamic userData) async {
    if (message.isEmpty) return;
    try {
      chatUseCase.sendMessage(message: message, userData: userData);
    } catch (e) {
      Get.dialog(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to send message'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      await scrollController.animateTo(
        scrollController.position.maxScrollExtent + 200,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      clearChat();
    }
  }

  void clearChat() {
    messageController.clear();
  }
}
