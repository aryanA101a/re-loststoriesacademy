import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:loststoriesacademy/UI/games/Games.dart';

import 'package:loststoriesacademy/models/lessons.dart';
import 'package:loststoriesacademy/models/reviews.dart';
import 'package:loststoriesacademy/models/singleLesson.dart';

class LessonServices {
  static Future<Lessons> getLessons(id) async {
    String lessonUrl =
        "https://www.loststoriesacademy.com/wp-json/ms_lms/v1/course/?id=$id";
    try {
      final response = await http.get(Uri.parse(lessonUrl));
      // print(response.statusCode);
      if (200 == response.statusCode) {
        // print(response.body);

        final Lessons lesson = lessonsFromJson(response.body);
        // print(lesson[0].courseTitle.toString());

        return lesson;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<SingleLesson> getLesson(id) async {
    String lessonUrl =
        "https://www.loststoriesacademy.com/wp-json/wp/v2/stm-lessons/$id";
    try {
      final response = await http.get(Uri.parse(lessonUrl));
      // print(response.statusCode);
      if (200 == response.statusCode) {
        // print(response.body);

        final SingleLesson lesson = singleLessonFromJson(response.body);
        print('lesson.id');

        return lesson;
      }
    } catch (e) {
      print(e);
    }
  }
  static Future<Reviews> getReviews(id) async {
    String url =
        "https://www.loststoriesacademy.com/wp-json/ms_lms/v1/course_reviews?id=$id";
    try {
      final response = await http.get(Uri.parse(url));
      // print(response.statusCode);
      if (200 == response.statusCode) {
        // print(response.body);

        final Reviews reviews = reviewsFromJson(response.body);
        

        return reviews;
      }
    } catch (e) {
      print(e);
    }
  }
}
