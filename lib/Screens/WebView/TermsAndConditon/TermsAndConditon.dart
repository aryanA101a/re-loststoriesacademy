import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class TermsAndConditoon extends StatelessWidget {
 FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.loststoriesacademy.com/terms-conditions/";



  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: appBar(
          titleText: "Terms And Conditions",
          color:black,
          leadingWidget: null),
      url: urlString,
      withZoom: false,
    );
  }
}