import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/Screens/authentication/login/login.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar.dart';
import 'package:loststoriesacademy/Screens/initialPages.dart';

import 'package:loststoriesacademy/services/shared_serivces.dart';

import '../constants/auth.dart';

class LoginServices {
  static var client = http.Client();
  static String lognUrl = "https://www.loststoriesacademy.com/wp-json/wp/login";

  static Future login(context, String email, String password) async {
    try {
      var response = await client.get(
        Uri.parse("$lognUrl?user_email=$email&password=$password"),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json'
        },
      );
      print("Status Code: ${response.statusCode}");
      print("Response: ${response.body}");
      var decodedData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (decodedData['ID'] != null) {
          SharedServices.setLoginDetails(json.encode({
            'id': decodedData['ID'],
            'roles': decodedData['roles'],
            'capabilities': decodedData['allcaps'],
          })).then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => NavBar())));
        }

        // return response.statusCode == 200 ? true : false;
      } else if (response.statusCode == 500) {
        if (decodedData['code'] == 'incorrect_password') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Incorrect Password!')));
        } else if (decodedData['code'] == 'invalid_username') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Incorrect Username!')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Something went wrong!')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.body.toString())));
      }
    } catch (e) {
      if (e.message == 'Failed host lookup: \'www.loststoriesacademy.com\'') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Your internet seems to be down!')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Something went wrong!')));
      }

      print('bsdk : ${e.message}');
    }
  }
}
