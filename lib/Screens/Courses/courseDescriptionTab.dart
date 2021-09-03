import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:universal_html/parsing.dart';

class CourseDescriptionTab extends StatelessWidget {
  final description;
  CourseDescriptionTab({this.description});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        
          padding: EdgeInsets.all(10), child: Html(data: description)),
    );
  }
}
