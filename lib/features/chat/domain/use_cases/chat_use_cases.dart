// Export files for the use_cases of chat
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/features/chat/domain/repositories/chat_repository.dart';

class ChatUseCase {
  final ChatRepository chatRepository;
  ChatUseCase({required this.chatRepository});

  Stream<QuerySnapshot> getMessagesStream({required String receiverId}) {
    return chatRepository.getMessagesStream(receiverId: receiverId);
  }

  void sendMessage({required String message, required dynamic userData}) {
    chatRepository.sendMessage(message: message, userData: userData);
  }
}
