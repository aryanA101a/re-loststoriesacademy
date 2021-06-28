import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/models/courseslist.dart';

class CoursesCategoryServices {
  static const String ccurl =
      "https://www.loststoriesacademy.com/wp-json/wp/v2/stm-courses/?per_page=50&_embed";

  static Future<List<CoursesCategory>> getCoursesCategory() async {
    try {
      final response = await http.get(Uri.parse(ccurl));
      if (200 == response.statusCode) {
        // print(response.body);
        final List<CoursesCategory> coursesCategory =
            coursesCategoryFromJson(response.body).cast<CoursesCategory>();
        return coursesCategory;
      } else {
        return List<CoursesCategory>();
      }
    } catch (e) {
      return List<CoursesCategory>();
    }
  }
}
