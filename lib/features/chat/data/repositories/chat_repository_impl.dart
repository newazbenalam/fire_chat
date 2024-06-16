// Repository implementation for chat

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_chat/features/chat/data/models/chat_model.dart';
import 'package:fire_chat/features/chat/domain/repositories/chat_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRepositoryImpl implements ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepositoryImpl({required this.firestore, required this.auth});

  @override
  void sendMessage({required String message, required dynamic userData}) {
    Message newMessage = Message(
      message: message,
      senderId: auth.currentUser!.uid,
      receiverId: userData['uid'],
      senderEmail: auth.currentUser!.email.toString(),
      receiverEmail: userData['email'],
      time: DateTime.now(),
    );

    // firestore.collection('messages').add(
    //       newMessage.toJson(),
    //     );

    // chat room for the sender and receiver
    List<String> ids = [
      auth.currentUser!.uid,
      userData['uid'],
    ];
    ids.sort();
    firestore
        .collection('chat_rooms')
        .doc(ids.join('_'))
        .collection('messages')
        .add(
          newMessage.toJson(),
        );
  }

  @override
  Stream<QuerySnapshot> getMessagesStream({required String receiverId}) {
    List<String> ids = [
      auth.currentUser!.uid.toString(),
      receiverId,
    ];
    ids.sort();
    return firestore
        .collection('chat_rooms')
        .doc(ids.join('_'))
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }
}
