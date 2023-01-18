import 'package:flutter/material.dart';

import 'pages/event_list.dart';
import 'pages/home_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => const MyHomePage(title: 'Home Page'),
        '/event_list':(context) => const EventList(title: 'Events List'),
      },
      debugShowCheckedModeBanner: false,
      title: 'Bareek Event',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
