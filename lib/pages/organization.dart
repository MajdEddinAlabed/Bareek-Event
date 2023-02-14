import 'package:flutter/material.dart';

class Organization extends StatelessWidget {
  static String name = '/org_screen';

  const Organization({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return buildCard(index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 12);
          },
          itemCount: 30),
    );
  }

  Widget buildCard(int index) => Container(
        color: Colors.red.shade200,
        width: double.infinity,
        height: 150,
        child: Center(child: Text('card $index')),
      );
}
