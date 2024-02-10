import 'dart:convert';

import 'package:http/http.dart';
import 'package:login/users_model.dart';

class UserRepository {
  Future userData() async {
    Response response =
        await get(Uri.parse("https://reqres.in/api/users?page=2"));
    return UsersModel.fromJson(json.decode(response.body));
  }

  Future<Map<String, dynamic>> postJob(
      {required String name, required String job}) async {
    Response response = await post(
      Uri.parse("https://reqres.in/api/users"),
      body: {"name": name, "job": job},
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
