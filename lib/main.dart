// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_import
import 'package:event_app/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:event_app/Pages/reg_screen.dart';
import 'package:event_app/Pages/login_screen.dart';
import 'package:event_app/Pages/welcome_screen.dart';
import 'package:event_app/Pages/create_event_screen.dart';
import 'package:event_app/Pages/home.dart';
import 'package:event_app/Pages/makeOrg.dart';
import 'package:event_app/Pages/myOrg.dart';
import 'package:event_app/Pages/organization.dart';
import 'package:event_app/Pages/event_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bareek Event',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromARGB(255, 57, 24, 100),
              secondary: Color.fromARGB(255, 102, 45, 139))),
      initialRoute: '/',
      routes: {
        //HomeScreen.name: (context) => HomeScreen(),
        //LoginScreen.name: (context) => const LoginScreen(),
        Home.name: (context) => Home(),
        Organization.name: (context) => Organization(),
        myOrg.name: (context) => myOrg(),
        MakeOrg.name: (context) => MakeOrg(),
        RegScreen.name: (context) => const RegScreen(),
        EventDetailsScreen.name: (context) => const EventDetailsScreen(),
        CreateEventScreen.name: (context) => CreateEventScreen(),
        MyHomePage.name: (context) => MyHomePage(title: "Majd"),
      },
    );
  }
}
