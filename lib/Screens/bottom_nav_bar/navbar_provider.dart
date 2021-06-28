import 'package:flutter/material.dart';

class NavbarProvider with ChangeNotifier {
  int navIndex = 0;
  int get getIndex => navIndex;
  changeIndex(index) {
    navIndex = index;
    notifyListeners();
  }
}
