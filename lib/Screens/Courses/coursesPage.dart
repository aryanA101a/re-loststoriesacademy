import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/Courses/lessonsPage.dart';
import 'package:loststoriesacademy/Screens/drawer.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/models/courseslist.dart';
import 'package:loststoriesacademy/services/CourcesCategoryServices.dart';
import 'package:loststoriesacademy/services/singleLesson.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class CoursesPage extends StatelessWidget {
  List _cousesCategory;

  Future courseCategoryFetch() async {
    await CoursesCategoryServices.getCoursesCategory().then((cousesCategory) {
      LessonServices.getLesson(13024);
      _cousesCategory = cousesCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar(titleText: 'Courses', color: blue_sofa),
          drawer: HomePageDrawer(),
          body: FutureBuilder(
              future: courseCategoryFetch(),
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
                      buildListViewBlock(context,
                          title: 'Music Production',
                          subtitle:
                              'Watch some really awesome courses on Music Production.',
                          indexx: _cousesCategory.length,
                          categoryNum: 190),
                      buildListViewBlock(context,
                          title: 'Mixing & Mastering',
                          subtitle:
                              'Watch some really awesome courses on Music Production.',
                          indexx: _cousesCategory.length,
                          categoryNum: 191),
                      buildListViewBlock(context,
                          title: 'Instruments Courses',
                          subtitle:
                              'Watch some really awesome courses on Music Production.',
                          indexx: _cousesCategory.length,
                          categoryNum: 192),
                      buildListViewBlock(context,
                          title: 'Music Business',
                          subtitle:
                              'Watch some really awesome courses on Music Production.',
                          indexx: _cousesCategory.length,
                          categoryNum: 193),
                      buildListViewBlock(context,
                          title: 'Audio Engineering',
                          subtitle:
                              'Watch some really awesome courses on Music Production.',
                          indexx: _cousesCategory.length,
                          categoryNum: 194),
                    ],
                  );
                }
                {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                }
              })),
    );
  }

  Column buildListViewBlock(
    BuildContext context, {
    title,
    subtitle,
    child,
    indexx,
    categoryNum,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(left: 22, top: 33),
        child: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 22, top: 8),
        child: Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 13,
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.32,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            indexx,
            (index) {
              // print(_cousesCategory[index].id);
              return (_cousesCategory[index].stmLmsCourseTaxonomy[0] ==
                      categoryNum)
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonsPage(
                                courseId: _cousesCategory[index].id,
                              ),
                            ));
                      },
                      child: courseCard(
                        image: _cousesCategory[index]
                            .embedded
                            .wpFeaturedmedia[0]
                            .sourceUrl,
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ),
    ]);
  }
}
