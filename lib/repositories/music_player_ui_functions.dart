import 'package:flutter/cupertino.dart';

class MPUIFunctions with ChangeNotifier {
  String currentLanguage = 'ENG';
  String get getLanguage => currentLanguage;
  changeLanguage({lang}) {
    currentLanguage = lang;
    notifyListeners();
  }

  bool isPlaying = false;
  bool get getValue => isPlaying;
  changeValue() {
    isPlaying = !isPlaying;
    notifyListeners();
  }
  changeValueWithParam(bool val) {
    isPlaying = val;
    notifyListeners();
  }
}
