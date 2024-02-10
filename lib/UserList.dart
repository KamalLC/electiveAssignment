import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login/UserRepository.dart';
import 'package:login/user_detail_page.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future<Map<String, dynamic>> userData() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }

  String responseData = "Data Not Posted";

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: FutureBuilder(
        future: UserRepository().userData(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final userList = snapshot.data!.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...userList.map(
                      (user) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) {
                                return UserDetailPage(
                                  user: user,
                                );
                              },
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user.avatar),
                            ),
                            title: Text("${user.firstName} ${user.lastName}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Text("No Data Available");
          }
        },
      ),
    );
  }
}
