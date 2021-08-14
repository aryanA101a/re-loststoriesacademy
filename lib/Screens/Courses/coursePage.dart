import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/Courses/InfoTab.dart';
import 'package:loststoriesacademy/Screens/Courses/courseDescriptionTab.dart';
import 'package:loststoriesacademy/Screens/Courses/lessonVideoPage.dart';
import 'package:loststoriesacademy/Screens/Courses/lessonsTab.dart';
import 'package:loststoriesacademy/Screens/Courses/reviewsTab.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/models/lessons.dart';
import 'package:loststoriesacademy/services/lessonServices.dart';
import 'package:loststoriesacademy/widget/listtileWidget.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class CoursePage extends StatefulWidget {
  final courseId;
  final img;
  final title;
  CoursePage({this.courseId, this.img, this.title});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;

  Future<Lessons> lessonsFetch() async {
    Lessons data = await LessonServices.getLessons(widget.courseId);
    return data;
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.courseId.toString());
    return Scaffold(
        appBar: appBar(titleText: 'Lessons', color: blue_sofa),
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.only(left: 22, top: 33),
                  child: Text(
                    widget.title.toString(),
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
                          widget.img,
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                        labelStyle: TextStyle(),
                        controller: tabController,
                        unselectedLabelColor: blue_sofa,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            // border: Border.all(width: .5, color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                            color: blue_sofa),
                        tabs: [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Lessons",
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Description",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Info"),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text("Reviews"),
                            ),
                          ),
                        ]),
                  ),
                ),
              ]))
            ];
          },
          body: FutureBuilder<Lessons>(
              future: lessonsFetch(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  log(snapshot.data.curriculum[1].label.toString());
                  return TabBarView(
                    controller: tabController,
                    children: [
                      LessonsTab(data: snapshot.data),
                      CourseDescriptionTab(
                          description: snapshot.data.description),
                      InfoTab(info: snapshot.data.meta),
                      ReviewsTab(
                        courseId: widget.courseId,
                      )
                    ],
                  );
                }
                {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                }
              }),
        ));
  }
}


// ListView(
//         shrinkWrap: true,
//         children: [
          // Container(
          //   margin: EdgeInsets.only(left: 22, top: 33),
          //   child: Text(
          //     widget.title.toString(),
          //     style: GoogleFonts.poppins(
          //         fontSize: 20, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Card(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20)),
          //     child: Center(
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(20),
          //         child: Image.network(
          //           widget.img,
          //           // fit: BoxFit.contain,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
//           // Container(
//           //   margin: EdgeInsets.only(left: 22, bottom: 33),
//           //   child: Text(
//           //     'Lessons',
//           //     style: GoogleFonts.poppins(
//           //         fontSize: 20, fontWeight: FontWeight.bold),
//           //   ),
//           // ),
          // Container(
          //   color: Colors.amber,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: TabBar(
          //         unselectedLabelColor: Colors.white,
          //         indicatorSize: TabBarIndicatorSize.tab,
          //         indicator: BoxDecoration(
          //             // border: Border.all(width: .5, color: Colors.white),
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.grey),
          //         tabs: [
          //           Tab(
          //             child: Align(
          //               alignment: Alignment.center,
          //               child: Text("Lessons"),
          //             ),
          //           ),
          //           Tab(
          //             child: Align(
          //               alignment: Alignment.center,
          //               child: Text("Description"),
          //             ),
          //           ),
          //         ]),
          //   ),
          // ),
//           Container(
//             height: 300,
            // child: TabBarView(
            //   children: [
            //     LessonsTab(courseId: widget.courseId),
            //     CourseDescriptionTab()
            //   ],
            // ),
//           ),
//         ],
//       ),