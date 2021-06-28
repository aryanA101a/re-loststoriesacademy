
import 'package:flutter/material.dart';
import './drawer.dart';

import 'package:loststoriesacademy/constants/dimensions.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;
  PageController pageController = PageController();


 

  // int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: pcolor,
        ),
        drawer: HomePageDrawer(),
        body: Center(
          child: Text('Courses! In Progress...'),
        ));
  }
}
