import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String name = '/login_screen';

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
                  autofocus: false,
                  decoration: const InputDecoration(
                      labelText: "Enter Email", icon: Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Enter Password", icon: Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Row(children: [
                  const Center(
                    child: Text(
                      "Dont have an account yet?       ",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/reg_screen');
                    },
                    child: const Text('Click to Register'),
                  ),
                ]),
                const SizedBox(
                  height: 40.0,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 78, 10, 5),
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home_screen');
                      },
                      child: const Text('Login'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
