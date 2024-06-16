import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/features/home/domain/entities/home_entities.dart';

// ChatServices
class ChatServicesImp extends ChatServicesEntity {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Stream<QuerySnapshot> getMessages() {
    return firestore.collection('messages').orderBy('timestamp').snapshots();
  }

  Future<void> sendMessage(String message) async {
    await firestore.collection('messages').add({
      'message': message,
      'timestamp': DateTime.now(),
    });
  }

  Future<void> deleteMessage(String id) async {
    await firestore.collection('messages').doc(id).delete();
  }

  Future<void> updateMessage(String id, String message) async {
    await firestore.collection('messages').doc(id).update({
      'message': message,
    });
  }

  Future<void> clearMessages() async {
    final messages = await firestore.collection('messages').get();
    for (final message in messages.docs) {
      await message.reference.delete();
    }
  }

  Future<void> addMessage(String message) async {
    await firestore.collection('messages').add({
      'message': message,
      'timestamp': DateTime.now(),
    });
  }

  Future<void> updateMessageField(String id, String message) async {
    await firestore.collection('messages').doc(id).update({
      'message': message,
    });
  }

  Future<void> deleteMessageField(String id) async {
    await firestore.collection('messages').doc(id).delete();
  }

  Future<void> clearAllMessages() async {
    final messages = await firestore.collection('messages').get();
    for (final message in messages.docs) {
      await message.reference.delete();
    }
  }

  Future<void> addMessageField(String message) async {
    await firestore.collection('messages').add({
      'message': message,
      'timestamp': DateTime.now(),
    });
  }

  Future<void> updateMessageFieldField(String id, String message) async {
    await firestore.collection('messages').doc(id).update({
      'message': message,
    });
  }

  Future<void> deleteMessageFieldField(String id) async {
    await firestore.collection('messages').doc(id).delete();
  }

  Future<void> clearAllMessagesField() async {
    final messages = await firestore.collection('messages').get();
    for (final message in messages.docs) {
      await message.reference.delete();
    }
  }

  Future<void> addMessageFieldField(String message) async {
    await firestore.collection('messages').add({
      'message': message,
      'timestamp': DateTime.now(),
    });
  }
}
