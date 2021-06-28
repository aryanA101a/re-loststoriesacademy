import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loststoriesacademy/Screens/authentication/login/login.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar.dart';

import 'package:loststoriesacademy/navdecider.dart';

import 'package:loststoriesacademy/services/shared_serivces.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();





  runApp(NavDecider());
}
