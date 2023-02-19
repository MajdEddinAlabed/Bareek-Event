// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MakeOrg extends StatelessWidget {
  const MakeOrg({super.key});
  static String name = '/makeOrg_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Making organization'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text('organization name'),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Organization name'),
            ),
            const Text('description'),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Organization name'),
            ),
          ],
        ),
      ),
    );
  }
}
