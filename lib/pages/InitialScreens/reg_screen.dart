// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as prefix;
import 'package:flutter/material.dart';
import 'package:event_app/utils/eventmodel.dart';

class RegScreen extends StatefulWidget {
  static String name = '/reg_screen';
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController useridController = TextEditingController();

  void login(String username, email, password, userid) async {
    try {
      prefix.Response response = await prefix.post(
          Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        EventModel data1 = EventModel.fromRawJson(response.body);
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                const Text('Email'),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Password'),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login_screen');
                        login(
                            emailController.text.toString(),
                            passwordController.text.toString(),
                            nameController.text.toString(),
                            useridController.text.toString());
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(18)),
                        child: const Center(
                          child: Text('login'),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
