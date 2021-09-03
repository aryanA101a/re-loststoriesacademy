import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class LiveClasses extends StatelessWidget {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.loststoriesacademy.com/live-classes/";

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: appBar(titleText: "Live Classes", color: black, leadingWidget: null),
       url: urlString,
      withZoom: false,
    );
  }
}
