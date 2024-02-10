import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:login/users_model.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});
  final UserData user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(user.avatar),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("User Id: ${user.id}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("First Name: ${user.firstName}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Last Name: ${user.lastName}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Email: ${user.email}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(user.avatar),
            ),
          ],
        ),
      ),
    );
  }
}
