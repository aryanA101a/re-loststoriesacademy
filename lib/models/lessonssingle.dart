// To parse this JSON data, do
//
//     final singleLesson = singleLessonFromJson(jsonString);

import 'dart:convert';

List<SingleLesson> singleLessonFromJson(String str) => List<SingleLesson>.from(json.decode(str).map((x) => SingleLesson.fromJson(x)));

String singleLessonToJson(List<SingleLesson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleLesson {
    SingleLesson({
        this.courseId,
        this.courseTitle,
        this.courseImg,
        this.lessons,
    });

    int courseId;
    String courseTitle;
    String courseImg;
    List<Lesson> lessons;

    factory SingleLesson.fromJson(Map<String, dynamic> json) => SingleLesson(
        courseId: json["course_id"],
        courseTitle: json["course_title"],
        courseImg: json["course_img"],
        lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "course_title": courseTitle,
        "course_img": courseImg,
        "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
    };
}

class Lesson {
    Lesson({
        this.lessonId,
        this.lessonTitle,
    });

    int lessonId;
    String lessonTitle;

    factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        lessonId: json["lesson_id"],
        lessonTitle: json["lesson_title"],
    );

    Map<String, dynamic> toJson() => {
        "lesson_id": lessonId,
        "lesson_title": lessonTitle,
    };
}
