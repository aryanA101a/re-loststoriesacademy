import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class GameWebview extends StatelessWidget {
  final gameUrl;
  final gameName;
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  launchUrl(urlString) {
    flutterWebviewPlugin.reloadUrl(urlString);
  }

  GameWebview({this.gameUrl, this.gameName});
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: gameUrl,
      appBar: appBar(
        titleText: gameName,
        color: black,
      ),
      withJavascript: true,
      withZoom: false,
    );
  }
}
