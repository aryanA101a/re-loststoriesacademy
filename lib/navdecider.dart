import 'package:flutter/material.dart';
import 'package:loststoriesacademy/Screens/authentication/login/login.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar_provider.dart';
import 'package:loststoriesacademy/Screens/initialPages.dart';
import 'package:loststoriesacademy/repositories/music_player_ui_functions.dart';
import 'package:loststoriesacademy/repositories/userExperience.dart';

import 'package:loststoriesacademy/services/shared_serivces.dart';
import 'package:provider/provider.dart';


class NavDecider extends StatefulWidget {


  @override
  _NavDeciderState createState() => _NavDeciderState();
}

class _NavDeciderState extends State<NavDecider> {
  bool isLoggedIn = false;

  check() async {
    await SharedServices.isLoggedIn().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserExperience(),
          ),
          ChangeNotifierProvider(
            create: (_) => MPUIFunctions(),
          ),
          ChangeNotifierProvider(
            create: (_) => NavbarProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isLoggedIn
              ? NavBar()
              : InitialPages(),
        ));
  }
}

