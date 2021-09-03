import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:loststoriesacademy/Screens/Courses/lessonVideoPage.dart';
import 'package:loststoriesacademy/models/lessons.dart';
import 'package:loststoriesacademy/services/lessonServices.dart';
import 'package:loststoriesacademy/widget/listtileWidget.dart';

class LessonsTab extends StatelessWidget {
  final data;
  LessonsTab({Key key, this.data}) : super(key: key);
  final unescape = HtmlUnescape();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: data.curriculum.length,
            itemBuilder: (context, index) {
              String title =
                  unescape.convert(data.curriculum[index].label.toString());
              return data.curriculum[index].label != null
                  ? LessonListTile(
                      title: title,
                      subtitle: "... min",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonVideoPage(
                                  title: title,
                                  lessonId: data.curriculum[index].lessonId
                                      .toString()),
                            ));
                      },
                    )
                  : Container();
            }));
  }
}
