// Abstract repository definition for chat
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepository {
  Stream<QuerySnapshot> getMessagesStream({required String receiverId});
  void sendMessage({required String message, required dynamic userData});
}
