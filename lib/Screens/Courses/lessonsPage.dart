import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/Courses/lessonVideoPage.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/models/lessons.dart';
import 'package:loststoriesacademy/services/lessonServices.dart';
import 'package:loststoriesacademy/widget/listtileWidget.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class LessonsPage extends StatelessWidget {
  final courseId;
  final img;
  final title;
  LessonsPage({this.courseId, this.img, this.title});
  Lessons _lessons;
  Future lessonsFetch() async {
    await LessonServices.getLessons(courseId).then((lessons) {
      _lessons = lessons;
      print(_lessons.curriculum[0].label);
      print('xxxxxxxxxxxxxxxxxxx');
    });
  }

  @override
  Widget build(BuildContext context) {
    log(courseId.toString());
    return Scaffold(
      appBar: appBar(titleText: 'Lessons', color: blue_sofa),
      body: FutureBuilder(
          future: lessonsFetch(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              log(_lessons.curriculum[1].label.toString());
              return ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 22, top: 33),
                    child: Text(
                      title.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            img,
                            // fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 22, bottom: 33),
                    child: Text(
                      'Lessons',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _lessons.curriculum.length,
                      itemBuilder: (context, index) {
                        return _lessons.curriculum[index].label != null
                            ? LessonListTile(
                                title:
                                    _lessons.curriculum[index].label.toString(),
                                subtitle: "... min",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LessonVideoPage(
                                          title: _lessons
                                                .curriculum[index].label
                                                .toString(),
                                          
                                            lessonId: _lessons
                                                .curriculum[index].lessonId
                                                .toString()),
                                      ));
                                },
                              )
                            : Container();
                      }),
                ],
              );
            }
            {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }
}
