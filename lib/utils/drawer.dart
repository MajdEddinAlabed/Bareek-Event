import 'package:event_app/Pages/home_page.dart';
import 'package:flutter/material.dart';

class DrawerClass extends StatelessWidget {
  const DrawerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItem(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        color: Colors.blue.shade700,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 153, 19, 230),
                  radius: 32,
                  child: Text('W'),
                ),
                SizedBox(height: 12),
                Text(
                  'anyone',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'anyone513@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(BuildContext context) => Wrap(
        runSpacing: 10,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home_screen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.groups_outlined),
            title: const Text('Organizations'),
            onTap: () {
              Navigator.pushNamed(context, '/org_screen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.group_work_outlined),
            title: const Text('My organizations'),
            onTap: () {
              Navigator.pushNamed(context, '/myorg_screen');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.group_work_outlined),
            title: const Text('Majd Pages'),
            onTap: () {
              Navigator.pushNamed(context, MyHomePage.name);
            },
          ),
        ],
      );
}
