/*
@ Author: Newaz Ben Alam
@ Email:  newazbenalam@gmail.com
@ GitHub: github.com/newazbenalam
*/

import 'package:fire_chat/core/app_constants.dart';
import 'package:fire_chat/core/drawer_elements.dart';
import 'package:fire_chat/features/home/presentation/controller/home_controller.dart';
import 'package:fire_chat/features/home/presentation/widgets/build_user_list.dart';
import 'package:fire_chat/features/home/presentation/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

HomeController controller = Get.find();

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () => controller.logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: myDrawer(controller),
      body: buildUserList(),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
      stream: controller.getHomeUseCase.getUsersStream(),
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
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No users found'),
          );
        }
        return ListView(
            children: snapshot.data!.map<Widget>((userdata) {
          return BuildListItems(
            userdata: userdata,
          );
        }).toList());
      },
    );
  }

  // Drawer widget
  Drawer myDrawer(HomeController controller) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              DrawerHeader(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: const BoxDecoration(
                  color: primaryColorLight,
                ),
                child: Center(
                  child: Image.asset(logo1),
                ),
              ),
              ...drawerElements.map((element) {
                return DrawerCustomTile(
                  title: element['title'].toString(),
                  icon: element['icon'] as IconData,
                  onTap: element['route'] as Function(),
                );
              }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: DrawerCustomTile(
              title: "Logout",
              icon: Icons.logout,
              onTap: () => controller.logout(),
            ),
          ),
        ],
      ),
    );
  }
}
