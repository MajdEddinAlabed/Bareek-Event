// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_import
import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
import 'Pages/reg_screen.dart';
import 'Pages/login_screen.dart';
import 'Pages/welcome_screen.dart';
import 'Pages/create_event_screen.dart';
import 'Pages/home.dart';
import 'Pages/makeOrg.dart';
import 'Pages/myOrg.dart';
import 'Pages/organization.dart';
import 'Pages/event_details_screen.dart';
import 'Pages/addresses_list_screen.dart';
import 'pages/organization_screen.dart';

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
        OrganizationScreen.name: (context) => OrganizationScreen(),
        Organization.name: (context) => Organization(),
        myOrg.name: (context) => myOrg(),
        MakeOrg.name: (context) => MakeOrg(),
        RegScreen.name: (context) => RegScreen(),
        EventDetailsScreen.name: (context) => EventDetailsScreen(),
        CreateEventScreen.name: (context) => CreateEventScreen(),
        AddressesListScreen.name: (context) => AddressesListScreen(),
        MyHomePage.name: (context) => MyHomePage(title: "Majd"),
      },
    );
  }
}
