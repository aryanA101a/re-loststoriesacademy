// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:loststoriesacademy/UI/testing/concaveShadow.dart';
// import 'package:loststoriesacademy/widget/listtileWidget.dart';
// // import 'package:loststoriesacademy/UI/podcast/shadow_support_file/myPainter.dart';
// // import 'package:loststoriesacademy/UI/testing/neumorphic_theme.dart';
// import 'package:loststoriesacademy/constants/colors.dart';

// import 'package:loststoriesacademy/widget/widgets.dart';

// import '../../constants/colors.dart';
// import '../../constants/colors.dart';


// class PodcastPage extends StatefulWidget {
//   @override
//   _PodcastPageState createState() => _PodcastPageState();
// }

// class _PodcastPageState extends State<PodcastPage> {
//   UserRepository userRepository = UserRepository();
  
//   // MyPainter myPainter = MyPainter();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Podcast",
//           style: TextStyle(
//             fontFamily: "Jost",
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: blue_sofa,
//       ),
//       // backgroundColor: Colors.blue,
//       body: ListView(
//         children: [
//           Container(
//             margin: EdgeInsets.only(left: 22, top: 33),
//             child: Text(
//               "Explore Podcasts",
//               style: GoogleFonts.poppins(
//                   fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 22, top: 8),
//             child: Text(
//               "Watch some really awesome pordcasts on music.",
//               style: GoogleFonts.poppins(
//                 fontSize: 13,
//               ),
//             ),
//           ),
//           Container(
//             height: 222, // give it a fixed height constraint
//             // color: Colors.teal,
//             // child ListView
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: [
//                 podcastShadowBox(text: "MUSIC INDUSTRY"),
//                 podcastShadowBox(text: "MUSIC INDUSTRY"),
//                 podcastShadowBox(text: "MUSIC INDUSTRY"),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 22, top: 33, right: 0, bottom: 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Popular",
//                   style: GoogleFonts.poppins(
//                       fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Container(
//                     margin: EdgeInsets.only(right: 20),
//                     child: TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "See all",
//                           style: GoogleFonts.poppins(
//                               decoration: TextDecoration.underline,
//                               decorationThickness: 3,
//                               // fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         )))
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 22, top: 0, bottom: 15),
//             child: Text(
//               "Catch up on the trending podcasts.",
//               style: GoogleFonts.poppins(
//                 fontSize: 13,
//               ),
//             ),
//           ),
//           ListView(
//             // scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               PodcastListTile(
//                 onTap: null,
//                 height: 100,
//                 thumbnail: Container(
//                   child: listTileThumbnail(),
//                 ),
//                 title: "How Music Industry Works",
//                 subtitle: "55 mins",
//               ),
//               PodcastListTile(
//                 onTap: null,
//                 height: 100,
//                 thumbnail: Container(
//                   child: listTileThumbnail(),
//                 ),
//                 title: "How Music Industry Works",
//                 subtitle: "55 mins",
//               ),
//               PodcastListTile(
//                 onTap: null,
//                 height: 100,
//                 thumbnail: Container(
//                   child: listTileThumbnail(),
//                 ),
//                 title: "How Music Industry Works",
//                 subtitle: "55 mins",
//               ),
//               PodcastListTile(
//                 onTap: null,
//                 height: 100,
//                 thumbnail: Container(
//                   child: listTileThumbnail(),
//                 ),
//                 title: "How Music Industry Works",
//                 subtitle: "55 mins",
//               ),
//               PodcastListTile(
//                 onTap: null,
//                 height: 100,
//                 thumbnail: Container(
//                   child: listTileThumbnail(),
//                 ),
//                 title: "How Music Industry Works",
//                 subtitle: "55 mins",
//               ),
//               PodcastListTile(
//                 onTap: null,
//                 height: 100,
//                 thumbnail: Container(
//                   child: listTileThumbnail(),
//                 ),
//                 title: "How Music Industry Works",
//                 subtitle: "55 mins",
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// //  Container(
// //           child: CustomPaint(
// //               painter: MyPainter(),
// //               child: Container(
// //                 padding: EdgeInsets.all(20),
// //                 child: Text('text',
// //                     style: TextStyle(color: Colors.white, fontSize: 30)),
// //               )),
// //         ),
