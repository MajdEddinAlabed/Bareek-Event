// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class OrganizationScreen extends StatefulWidget {
  static String name = '/orginfo_screen';

  const OrganizationScreen({super.key});
  @override
  _OrganizationScreenState createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organization'),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Organization Name',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              'Created by: Organization Creator',
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Description of the organization goes here.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () {
                      // Call phone number
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.email),
                    onPressed: () {
                      // Send email
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.link),
                    onPressed: () {
                      // Open link to social media
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add event button pressed
                    },
                    child: const Text('Add Event'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Modify addresses button pressed
                    },
                    child: const Text('Modify Addresses'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Followers button pressed
                    },
                    child: const Text('Followers'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: null,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child:
                        Container(width: 200, child: Text('Card ${index + 1}')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
