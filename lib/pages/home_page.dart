import 'package:event_app/utils/drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static String name = '/majd_pages';
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerClass(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/event_details_screen');
              },
              child: const Text('Event Details Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/new_event_screen');
              },
              child: const Text('New Event Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/testFromGhatGPT');
              },
              child: const Text('testFromGhatGPT'),
            ),

          ],
        ),
      ),
    );
  }
}