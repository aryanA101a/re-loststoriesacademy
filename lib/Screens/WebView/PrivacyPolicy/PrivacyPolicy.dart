import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class PrivacyPloicy extends StatelessWidget {
   FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.loststoriesacademy.com/privacy-policy/";

  
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: appBar(
      titleText: "Privacy Policy", color: black, leadingWidget: null),
      url: urlString,
      withZoom: false,
    );
  }
}