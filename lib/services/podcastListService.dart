// podcat List API service
import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/models/podcastlist.dart';

class PodcastsListsServices {
  static const String pclUrl =
      "https://www.loststoriesacademy.com/wp-json/wp/v2/podcasts/?per_page=100&_embed";

  static Future<List<PodcastsList>> getPodcastsLists() async {
    try {
      final response = await http.get(Uri.parse(pclUrl));
      if (200 == response.statusCode) {
        // print(response.body);
        final List<PodcastsList> podCastList =
            podcastsListFromJson(response.body).cast<PodcastsList>();
        // print(podCastList[1]);
        return podCastList;
      } else {
        return List<PodcastsList>();
      }
    } catch (e) {
      return List<PodcastsList>();
    }
  }
}
