

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class Gold extends StatelessWidget {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.loststoriesacademy.com/";
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: appBar(titleText: "Gold", color: blue_sofa, leadingWidget: null),
      url: urlString);
  }
}
