// Export files for the models of chat
import 'package:fire_chat/features/chat/domain/entities/chat_entity.dart';

class Message extends ChatEntity {
  Message(
      {required super.message,
      required super.senderId,
      required super.receiverId,
      required super.senderEmail,
      required super.receiverEmail,
      required super.time});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      senderEmail: json['senderEmail'],
      receiverEmail: json['receiverEmail'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'senderEmail': senderEmail,
      'receiverEmail': receiverEmail,
      'time': time,
    };
  }
}
