import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/models/Userdata.dart';
import 'package:loststoriesacademy/services/shared_serivces.dart';

import '../constants/auth.dart';

class UserDataServices {
  static var client = http.Client();
  static String userDataUrl =
      "https://www.loststoriesacademy.com/wp-json/wp/v2/users";

 

  static Future<UserData> dataFetch() async {
    try {
      var data = await SharedServices.loginDetails();
      var id = data['id'];
      print("data: $data");

      final response = await http.post(
        Uri.parse("$userDataUrl/$id"),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        var jsonSting = response.body;

        UserData userData = userDataFromJson(jsonSting);
        return userData;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<UserData> editData(
      context, String username, String name) async {
    var data = await SharedServices.loginDetails();
    var id = data['id'];
    var response = await http
        .put(Uri.parse("$userDataUrl/$id"),
            headers: <String, String>{
              'Authorization': 'Bearer $accessToken',
              'Content-Type': 'application/json; charset=UTF-8',
            },
            // body: {
            //   //   'user_nicename': name,
            //   //  // 'email': username
            //   'name': name,
            //   // 'username': username,
            // }

            body: jsonEncode(<String, String>{
              'name': name,
            }))
        .then((value) {
      print(value.statusCode);
      print("Updated Data :${value.body}");
      var decodedData = json.decode(value.body);

      if (value.statusCode == 200) {
      } else if (value.statusCode == 400) {
        if (decodedData["code"] == "rest_invalid_param") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Sorry, This username is invalid because it uses illegal characters. Please enter a valid username.")));
        }
      }
    });
  }
}
