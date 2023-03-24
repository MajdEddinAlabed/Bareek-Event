// ignore_for_file: library_private_types_in_public_api

import 'package:event_app/pages/User/profile_widget.dart';
import 'package:event_app/pages/User/user.dart';
import 'package:event_app/pages/User/user_preferences.dart';
import 'package:event_app/utils/button_widget.dart';
import 'package:flutter/material.dart';

class OrganizationScreen extends StatefulWidget {
  static String name = '/organization_screen';

  const OrganizationScreen({super.key});
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(_isFollowing ? Icons.check : Icons.add),
            onPressed: () {
              setState(() {
                _isFollowing = !_isFollowing;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Generate link to this page
            },
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagepath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: socialButtons()),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget socialButtons() => ButtonWidget(
        fb: const Icon(Icons.link),
        inst: const Icon(Icons.link),
        twit: const Icon(Icons.link),
        onClicked: () {},
      );
}
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       const Padding(
      //         padding: EdgeInsets.symmetric(vertical: 16.0),
      //         child: Text(
      //           'Organization Name',
      //           style: TextStyle(
      //             fontSize: 24.0,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       const Text(
      //         'Created by: Organization Creator',
      //         style: TextStyle(
      //           fontSize: 18.0,
      //           fontStyle: FontStyle.italic,
      //         ),
      //       ),
      //       const Padding(
      //         padding: EdgeInsets.all(16.0),
      //         child: Text(
      //           'Description of the organization goes here.',
      //           style: TextStyle(
      //             fontSize: 16.0,
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             IconButton(
      //               icon: const Icon(Icons.phone),
      //               onPressed: () {
      //                 // Call phone number
      //               },
      //             ),
      //             IconButton(
      //               icon: const Icon(Icons.email),
      //               onPressed: () {
      //                 // Send email
      //               },
      //             ),
      //             IconButton(
      //               icon: const Icon(Icons.link),
      //               onPressed: () {
      //                 // Open link to social media
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             ElevatedButton(
      //               onPressed: () {
      //                 // Add event button pressed
      //               },
      //               child: const Text('Add Event'),
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 // Modify addresses button pressed
      //               },
      //               child: const Text('Modify Addresses'),
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 // Followers button pressed
      //               },
      //               child: const Text('Followers'),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 220,
      //         width: double.infinity,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: null,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Card(
      //               child:
      //                   Container(width: 200, child: Text('Card ${index + 1}')),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),