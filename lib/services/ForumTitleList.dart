import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/models/ForumTitleList.dart';

class FourmTitleListServices {
  static Future<List<FourmTitleList>> getFourm(id) async {
    String fourmLTurl =
        "https://www.loststoriesacademy.com/wp-json/wp/v2/topic/$id";

    try {
      final response = await http.get(Uri.parse(fourmLTurl));
      print("respnse for fourm for $id : ${response.body}");

      if (response.statusCode == 200) {
        final List<FourmTitleList> fourmTitleList =
            fourmTitleListFromJson(response.body) as List<FourmTitleList>;

        return fourmTitleList;
      }
    } catch (e) {
      print(e);
    }
  }
}
