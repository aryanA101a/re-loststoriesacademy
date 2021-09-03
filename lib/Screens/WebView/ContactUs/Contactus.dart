import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class ContactUs extends StatelessWidget {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.loststoriesacademy.com/contact-us/";


  @override
  Widget build(BuildContext context) {
     return WebviewScaffold(
      appBar: appBar(
          titleText: "Contact Us",
          color: black,
          leadingWidget: null),
      url: urlString,
      withZoom: false,
    );
  }
}
