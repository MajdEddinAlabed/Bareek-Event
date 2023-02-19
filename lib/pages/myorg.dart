// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

final List<String> items = List<String>.generate(10000, (i) => '$i');

class myOrg extends StatelessWidget {
  const myOrg({super.key});
  static String name = '/myOrg_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('home screen'),
        ),
        body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xff764abc),
                child: Text(items[index]),
              ),
              title: Text('org ${items[index + 1]}'),
              subtitle: const Text(
                'this is a really long description for the organization',
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              trailing: const Icon(Icons.info_outline),
              onTap: () {
                Navigator.pushNamed(context, '/makeOrg_screen');
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}
