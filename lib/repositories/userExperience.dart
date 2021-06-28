import 'package:flutter/cupertino.dart';

class UserExperience with ChangeNotifier {
  bool isHidden = true;
  bool get getValue => isHidden;
  changeValue() {
    isHidden = !isHidden;
    notifyListeners();
  }

// #####################################################################################################

  
}
