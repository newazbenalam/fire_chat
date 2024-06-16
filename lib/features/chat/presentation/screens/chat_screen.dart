// Main screen for chat feature
import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/chat/presentation/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ChatController controller = Get.find<ChatController>();

class ChatScreen extends StatelessWidget {
  final dynamic userdata;
  final String? title;
  const ChatScreen({
    super.key,
    required this.title,
    this.userdata,
  });

  @override
  Widget build(BuildContext context) {
    controller.receiverId.value = userdata['uid'].toString();
    debugPrint('receiverId: ${controller.receiverId.value}');

    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? userdata['email']),
      ),
      body: Column(
        children: [
          const Expanded(
            child: GetMessageBuilder(),
          ),
          const Divider(height: 1),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(color: primaryColorLight),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: controller.messageController,
                onSubmitted: (value) => controller.sendMessage(value, userdata),
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send a message'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () async {
                  controller.sendMessage(
                      controller.messageController.text, userdata);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetMessageBuilder extends StatefulWidget {
  const GetMessageBuilder({
    super.key,
  });

  @override
  State<GetMessageBuilder> createState() => _GetMessageBuilderState();
}

class _GetMessageBuilderState extends State<GetMessageBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.chatUseCase
          .getMessagesStream(receiverId: controller.receiverId.value),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isBlank!) {
          return const Center(
            child: Text('No messages found'),
          );
        }
        return ListView(
          controller: controller.scrollController,
          children: snapshot.data!.docs.map<Widget>((message) {
            var alignment = (message['senderId'] ==
                    controller.auth.currentUser!.uid.toString())
                ? MainAxisAlignment.end
                : MainAxisAlignment.start;
            () {};
            return Row(
              mainAxisAlignment: alignment,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: (message['senderId'] ==
                            controller.auth.currentUser!.uid.toString())
                        ? primaryColorLight
                        : primaryColorMessage.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(message['message'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      Text(
                        message['senderEmail'],
                        style: const TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
