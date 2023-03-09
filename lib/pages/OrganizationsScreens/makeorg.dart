// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MakeOrg extends StatelessWidget {
  const MakeOrg({Key? key}) : super(key: key);
  static String name = '/makeOrg_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Making organization'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Organization name'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter organization name',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Description'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Social Media Links'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter social media links',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Contact Info'),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter phone number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
