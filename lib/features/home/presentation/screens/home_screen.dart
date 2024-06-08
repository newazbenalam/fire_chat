/*
@ Author: Newaz Ben Alam
@ Email:  newazbenalam@gmail.com
@ GitHub: github.com/newazbenalam
*/

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeScreen'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
