// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  static String name = '/userProfile';

  const UserProfile({super.key});
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            child: Text('m'),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'johndoe@example.com',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Edit Profile'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
