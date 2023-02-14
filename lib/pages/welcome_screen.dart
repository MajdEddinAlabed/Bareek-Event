import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //static String name = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home screen'),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 95, 16, 105),
              Color.fromARGB(255, 30, 3, 53),
            ],
          )),
          child: const Center(
            child: Text(
              overflow: TextOverflow.ellipsis,
              'Welcome',
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login_screen');
        },
        tooltip: 'Head to login page',
        child: const Icon(Icons.skip_next),
      ),
    );
  }
}
