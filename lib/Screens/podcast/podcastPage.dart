import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/podcast_player/podcast_player.dart';
import 'package:loststoriesacademy/models/podcastlist.dart';
import 'package:loststoriesacademy/services/podcastListService.dart';

import 'package:loststoriesacademy/widget/listtileWidget.dart';

import 'package:loststoriesacademy/constants/colors.dart';

import 'package:loststoriesacademy/widget/widgets.dart';

import '../../constants/colors.dart';
import '../../constants/colors.dart';
import '../testing/innerShadow.dart';
import '../testing/innerShadow.dart';
import '../testing/neumorphic_theme.dart';
import '../testing/neumorphic_theme.dart';
import '../testing/neumorphic_theme.dart';
import '../testing/neumorphic_theme.dart';
import '../testing/neumorphic_theme.dart';

class PodcastPage extends StatefulWidget {
  @override
  _PodcastPageState createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage>
    with AutomaticKeepAliveClientMixin<PodcastPage> {
  List<PodcastsLists> _podcastLists;
  bool _loading;
 

  Future podcastListFetch() async {
    await PodcastsListsServices.getPodcastsLists().then((podcastsLists) {
      _podcastLists = podcastsLists;
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Podcast",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: blue_sofa,
      ),
      // backgroundColor: Colors.blue,
      body: FutureBuilder(
        future: podcastListFetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 22, top: 33),
                  child: Text(
                    "Explore Podcasts",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22, top: 8),
                  child: Text(
                    "Watch some really awesome pordcasts on music.",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  height: 222, // give it a fixed height constraint
                  // color: Colors.teal,
                  // child ListView
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _podcastLists.length,
                      itemBuilder: (context, index) {
                        return podcastShadowBox(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PodcastAudioPlayer(
                                      lang: {
                                        'eng': _podcastLists[index]
                                            .acf
                                            .track[0]
                                            .trackFile,
                                        'hin': _podcastLists[index]
                                            .acf
                                            .track[1]
                                            .trackFile,
                                        'guj': _podcastLists[index]
                                            .acf
                                            .track[2]
                                            .trackFile,
                                      },
                                      title: _podcastLists[index]
                                          .title
                                          .rendered
                                          .split("; ")[1],
                                    ),
                                  ));
                            },
                            text: _podcastLists[index]
                                .title
                                .rendered
                                .split("; ")[1],
                            fontSize: 25);
                      }),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 22, top: 33, right: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                  
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 22, top: 0, bottom: 15),
                  child: Text(
                    "Catch up on the trending podcasts.",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _podcastLists.length,
                    itemBuilder: (context, index) {
                      PodcastsLists podcastsLists = _podcastLists[index];
                      return PodcastListTile(
                        title: podcastsLists.title.rendered.split("; ")[1],
                        subtitle: "15 - 25 min",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PodcastAudioPlayer(
                                  lang: {
                                    'eng': podcastsLists.acf.track[0].trackFile,
                                    'hin': podcastsLists.acf.track[1].trackFile,
                                    'guj': podcastsLists.acf.track[2].trackFile,
                                  },
                                  title: podcastsLists.title.rendered
                                      .split("; ")[1],
                                ),
                              ));
                        },
                      );
                    }),
              ],
            );
          }
          {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}

//  FutureBuilder(
//             future: podcastListFetch(),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Container(
//                   child: Center(child: CircularProgressIndicator()),
//                 );
//               }
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     itemCount: _podcastLists.length,
//                     itemBuilder: (context, index) {
//                       PodcastsLists podcastsLists = _podcastLists[index];
//                       return PodcastListTile(
//                         title: podcastsLists.title.rendered.split("; ")[1],
//                         subtitle: "15 - 25 min",
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => PodcastAudioPlayer(
//                                   lang: {
//                                     'eng': podcastsLists.acf.track[0].trackFile,
//                                     'hin': podcastsLists.acf.track[1].trackFile,
//                                     'guj': podcastsLists.acf.track[2].trackFile,
//                                   },
//                                   title: podcastsLists.title.rendered
//                                       .split("; ")[1],
//                                 ),
//                               ));
//                         },
//                       );
//                     });
//               }
//               {
//                 return Container(
//                     child: Center(child: CircularProgressIndicator()));
//               }
//             },
//           ),
