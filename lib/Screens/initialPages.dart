import 'package:flutter/material.dart';
import 'package:loststoriesacademy/Screens/authentication/login/login.dart';
import 'package:loststoriesacademy/Screens/authentication/signup/signup.dart';
import 'package:loststoriesacademy/Screens/Courses/coursesPage.dart';
import 'package:loststoriesacademy/Screens/profile_page/Profile.dart';



class InitialPages extends StatefulWidget {
 

  @override
  _InitialPagesState createState() => _InitialPagesState();
}

class _InitialPagesState extends State<InitialPages> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          Login(),
          SignUp(),
          CoursesPage(),
          Profile(),
        
        ],
      ),
    );
  }
}
