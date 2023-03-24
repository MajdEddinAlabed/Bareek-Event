// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unused_import
import 'package:event_app/Pages/user_profile.dart';
import 'package:flutter/material.dart';
import 'Pages/InitialScreens/login_screen.dart';
import 'Pages/InitialScreens/reg_screen.dart';
import 'Pages/OrganizationsScreens/organization.dart';
import 'Pages/majd_pages.dart';
import 'Pages/create_event_screen.dart';
import 'Pages/home.dart';
import 'Pages/OrganizationsScreens/makeOrg.dart';
import 'Pages/OrganizationsScreens/myOrg.dart';
import 'Pages/event_details_screen.dart';
import 'Pages/addresses_list_screen.dart';
import 'Pages/test.dart';
import 'pages/OrganizationsScreens/organization_screen.dart';

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
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.blue, secondary: Colors.blue)),
      initialRoute: '/',
      routes: {
        // HomeScreen.name: (context) => HomeScreen(),
        // LoginScreen.name: (context) => const LoginScreen(),
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
        UserProfile.name: (context) => UserProfile(),
        Test.name: (context) => Test(),
      },
    );
  }
}
