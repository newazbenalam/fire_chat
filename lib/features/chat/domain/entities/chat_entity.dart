// Export files for the entities of chat

abstract class ChatEntity {
  final String message;
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final String receiverEmail;
  final DateTime time;
  ChatEntity({
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.senderEmail,
    required this.receiverEmail,
    required this.time,
  });
}
