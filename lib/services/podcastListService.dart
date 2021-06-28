// podcat List API service
import 'package:http/http.dart' as http;
import 'package:loststoriesacademy/models/podcastlist.dart';

class PodcastsListsServices {
  static const String pclUrl =
      "https://www.loststoriesacademy.com/wp-json/wp/v2/podcasts/?&per_page=100";

  static Future<List<PodcastsLists>> getPodcastsLists() async {
    try {
      final response = await http.get(Uri.parse(pclUrl));
      if (200 == response.statusCode) {
        // print(response.body);
        final List<PodcastsLists> podCastList =
            podcastsListsFromJson(response.body).cast<PodcastsLists>();
        // print(podCastList[1]);
        return podCastList;
      } else {
        return List<PodcastsLists>();
      }
    } catch (e) {
      return List<PodcastsLists>();
    }
  }
}
