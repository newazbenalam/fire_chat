import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/features/chat/presentation/screens/chat_screen.dart';
import 'package:fire_chat/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

HomeController controller = Get.find<HomeController>();

class BuildListItems extends StatelessWidget {
  final Map<String, dynamic> userdata;
  const BuildListItems({
    super.key,
    required this.userdata,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: ListTile(
        tileColor: primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onTap: () {
          // controller.navigateToChatScreen(userdata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                userdata: userdata,
                title: userdata['name'],
              ),
            ),
          );
        },
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(userdata['name'] ?? 'No name found'),
        subtitle: Text(userdata['email'] ?? 'No email found'),
      ),
    );
  }
}
