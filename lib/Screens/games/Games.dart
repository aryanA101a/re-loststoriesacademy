import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/constants/dimensions.dart';
import 'package:loststoriesacademy/models/Games.dart';
import 'package:loststoriesacademy/services/GamesServices.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage>
    with AutomaticKeepAliveClientMixin<GamesPage> {
  List<GameData> _games;

  Future gamesListFetch() async {
    await GamesServices.getGames().then((games) {
      _games = games;

      // print(games[0].details[0].allAccessPassOnly);
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    // print((size.height / size.width) * 10);
    return Scaffold(
      appBar: appBar(
        color: blue_sofa,
        titleText: "Games",
        leadingWidget: null,
      ),
      body: FutureBuilder(
          future: gamesListFetch(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Ear Training Games",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      """
Interactive Games To Learn EQ, COMPRESSRION, MUSIC, THEORY 
AND MORE""",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GridView.builder(
                      itemCount: _games.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          childAspectRatio: 3.8 / 2,
                          crossAxisCount: 2),
                      physics: NeverScrollableScrollPhysics(),
                      // scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        GameData games = _games[index];
                        // print(games.gameName);

                        return gamesBottomList(
                          context,
                          height: size.height * 0.1,
                          width: size.width * 0.45,
                          title: games.gameName,
                          gameUrl: List.generate(games.details.length,
                              (index) => games.details[index].gamelink),
                          nTitle: List.generate(
                              games.details.length,
                              (index) =>
                                  games.details[index].name +
                                  ' ' +
                                  games.details[index].category),
                          color: HexColor(games.parentCardHex),
                        );
                      }),
                ],
              );
            }
            {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }

  Stack gameSquareBox({text, color}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
              color: color,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 4, color: Colors.black12, spreadRadius: 2)
              ],
            ),
            child: CircleAvatar(
              radius: 22.0,
              backgroundColor: base_purple,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
