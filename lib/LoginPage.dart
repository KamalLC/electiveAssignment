import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login/UserList.dart';
import 'package:login/UserRepository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(context) {
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();
    var passwordVisible = false;
    return Scaffold(
      appBar: AppBar(title: const Text("Kamal Lamichhane's App")),
      // backgroundColor: Colors.red,
      body: Center(
        child: Container(
          // color: Colors.amber.shade200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController1,
                decoration: const InputDecoration(
                    label: Text("Username"), fillColor: Colors.amber),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: !passwordVisible,
                controller: textController2,
                decoration: const InputDecoration(
                  // counterText: "*",

                  label: Text("Password"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final response = await UserRepository().postJob(
                      name: textController1.text, job: textController2.text);

                  if (response["name"] == "kamal" &&
                      response["job"] == "kamal123") {
                    print("reached here");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          //TODO: redirect here
                          return const UserList();
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Username or Password Invalid")));
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
