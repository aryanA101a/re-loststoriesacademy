import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/models/FourmsList.dart';

class FourmListsServices {
  static const String fourmlUrl =
      "https://www.loststoriesacademy.com/wp-json/wp/v2/forum/?order=asc&_embed";

  static Future<List<FourmList>> getFourmList() async {
    try {
      final response = await http.get(Uri.parse("$fourmlUrl"));

      if (response.statusCode == 200) {
        print("respnse for fourm : ${response.body}");
        final List<FourmList> fourmList =
            fourmListFromJson(response.body).cast<FourmList>();

        return fourmList;
      }
    else {
        return List<FourmList>();
      }
    } catch (e) {
      return List<FourmList>();
    }
  }
}
