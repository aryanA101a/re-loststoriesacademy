import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loststoriesacademy/Screens/authentication/login/login.dart';
import 'package:loststoriesacademy/Screens/initialPages.dart';
import 'package:loststoriesacademy/models/LoginResponseModel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  static Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    print("Login Details of user: ${pref.getString("login_details")}");

    return pref.getString("login_details") != null ? true : false;
  }

  static Future loginDetails() async {
    final pref = await SharedPreferences.getInstance();
    // print(json.decode(pref.getString("login_details")));
    return json.decode(pref.getString("login_details"));
  }

  static Future<void> setLoginDetails(res) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("login_details", res);
  }

  static Future<void> logout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => InitialPages()));
  }
}
