import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:loststoriesacademy/UI/games/Games.dart';
import 'package:loststoriesacademy/models/Games.dart';

class GamesServices {
  static const String gameurl =
      "https://www.loststoriesacademy.com/wp-json/wp/v2/games/";

  static Future<List<GameData>> getGames() async {
    try {
      final response = await http.get(Uri.parse(gameurl));
      if (200 == response.statusCode) {
        // print('ms');
        // print(jsonDecode(response.body)[0]['ACF']['etgame']);
        // print(jsonDecode(response.body)[0]['ACF']['etgame']);
        // print(response.body);
        final List<GameData> games =
            gameDataFromJson((jsonDecode(response.body)[0]['ACF']['etgame']))
                .cast<GameData>();
        // print(games[0].gameName);
        return games;
      }
    } catch (e) {
      return [];
    }
  }
}
