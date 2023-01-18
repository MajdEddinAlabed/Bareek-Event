import 'package:flutter/material.dart';
import 'package:event_app/drawer.dart';

class MyHomePage extends StatefulWidget {
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
      // ignore: prefer_const_constructors
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/event_list');
              },
              child: const Text('Event List Screen'),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final String name;
  final Widget icon;

  const DrawerItems(this.name, {super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      minLeadingWidth: 10,
      title: Text(name),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
