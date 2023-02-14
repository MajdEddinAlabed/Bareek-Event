// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element
import 'package:flutter/material.dart';
import 'package:event_app/Pages/reg_screen.dart';
import 'package:event_app/Pages/login_screen.dart';
import 'package:event_app/Pages/welcome_screen.dart';
import 'package:event_app/Pages/fromchatgpt.dart';
import 'package:event_app/Pages/home.dart';
import 'package:event_app/Pages/makeorg.dart';
import 'package:event_app/Pages/myorg.dart';
import 'package:event_app/Pages/new_event_screen.dart';
import 'package:event_app/Pages/organization.dart';
import 'package:event_app/Pages/event_details_screen.dart';

void main() {
  runApp(const MyApp());
}

// mjjd sho bdk?
//smd noob
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        HomeScreen.name: (context) => HomeScreen(),
        LoginScreen.name: (context) => const LoginScreen(),
        Home.name: (context) => Home(),
        Organization.name: (context) => Organization(),
        myorg.name: (context) => myorg(),
        MakeOrg.name: (context) => MakeOrg(),
        RegScreen.name: (context) => const RegScreen(),
        EventDetailsScreen.name: (context) => const EventDetailsScreen(),
        NewEventScreen.name: (context) =>
            const NewEventScreen(title: 'Create New Event'),
        CreateEventPage.name: (context) => CreateEventPage(),
      },
    );
  }
}
