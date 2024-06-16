import 'package:fire_chat/core/app_constants.dart';
import 'package:flutter/material.dart';

class DrawerCustomTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const DrawerCustomTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        tileColor: primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Text(title),
        leading: Icon(icon),
        onTap: () => onTap(),
      ),
    );
  }
}
