import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:loststoriesacademy/UI/games/Games.dart';

import 'package:loststoriesacademy/models/lessonssingle.dart';

class LessonServices {
  static Future<List<GetLessons>> getLesson(id) async {
    String lessonUrl =
        "https://www.loststoriesacademy.com/wp-json/wp/v2/stm-lessons/?stm-courses=$id";
    try {
      final response = await http.get(Uri.parse(lessonUrl));
      // print(response.statusCode);
      if (200 == response.statusCode) {
        // print(response.body);

        final List<GetLessons> lesson =
            getLessonsFromJson(response.body).cast<GetLessons>();
        // print(lesson[0].courseTitle.toString());

        return lesson;
      }
    } catch (e) {
      print(e);
    }
  }
}
