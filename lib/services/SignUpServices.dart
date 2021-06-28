import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/Screens/authentication/login/login.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar.dart';
import 'package:loststoriesacademy/services/shared_serivces.dart';

import '../constants/auth.dart';

class SignUpServices {
  static var client = http.Client();
  static String signupUrl =
      "https://www.loststoriesacademy.com/wp-json/wp/v2/users";
  

  static Future<bool> signUp(
      context, String username, String email, String password) async {
    try {
      var response = await client.post(Uri.parse("$signupUrl"), headers: {
        'Authorization': 'Bearer $accessToken'
      }, body: {
        "username": username,
        "email": email,
        "password": password
      }).then((value) {
        print("Resonse ${value.body}");
        print("Status Code : ${value.statusCode}");
        var decodedData = json.decode(value.body);
        print(decodedData);

        if (value.statusCode == 201) {
          if (decodedData['id'] != null) {
            SharedServices.setLoginDetails(json.encode({
              'id': decodedData['id'],
              'roles': decodedData['roles'],
              'capabilities': decodedData['capabilities'],
            })).then((value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NavBar())));
     
          }
        } else if (value.statusCode == 500) {
          if (decodedData['code'] == "existing_user_email") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Sorry, that email address is already used!")));
          } else if (decodedData["code"] == "existing_user_login") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Sorry, that username already exists!")));
          }  else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Something went wrong!')));
          }
        }else if(value.statusCode == 400){
          if (decodedData["code"] == "rest_invalid_param") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Sorry, Invalid email address!")));
          }

        }
      });
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
