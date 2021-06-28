import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/services/singleLesson.dart';
import 'package:loststoriesacademy/widget/listtileWidget.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class LessonsPage extends StatelessWidget {
  final courseId;
  LessonsPage({this.courseId});
  var _lessons;
  Future lessonsFetch() async {
    await LessonServices.getLesson(courseId).then((lessons) {
      _lessons = lessons;
      // print(_lessons[0].courseImg);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              return ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 22, top: 33),
                    child: Text(
                      _lessons[0]
                          .courseTitle
                          .toString()
                          .replaceFirst('<br> ', ''),
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
                            _lessons[0].courseImg,
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
                      itemCount: _lessons[0].lessons.length,
                      itemBuilder: (context, index) {
                        return LessonListTile(
                          title: _lessons[0].lessons[index].lessonTitle,
                          subtitle: "... min",
                          onTap: () {},
                        );
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
