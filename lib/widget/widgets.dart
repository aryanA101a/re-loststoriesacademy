
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/games/gameWebview.dart';
import 'package:loststoriesacademy/Screens/podcast/shadow_support_file/myPainter.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/constants/dimensions.dart';


Widget textFormField(
  BuildContext context, {
  initialValue,
  validator,
  onChanged,
  String hintText = "",
  double radius = 10,
  double borderWidth = 1.5,
  controller,
  double hMargin = 0,
  double vMargin = 10,
  obscureText = false,
  int maxLength,
  dynamic keyboardType,
  suffixIcon,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.98,
    margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: TextFormField(
        maxLength: maxLength,
        initialValue: initialValue,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autovalidate: true,
        autocorrect: true,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          contentPadding: EdgeInsets.all(6),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(color: Colors.blue, width: borderWidth),
          ),
          border: InputBorder.none,
          //  OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(radius),
          //   borderSide: BorderSide(
          //     color: Colors.blue,
          //     width: borderWidth,
          //   ),
          // ),
          filled: true,
          fillColor: Color(0xffE6E6E6),
          enabledBorder: InputBorder.none,

          // OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(radius),
          //   borderSide: BorderSide(color: Colors.blue, width: borderWidth),
          // ),
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    ),
  );
}

Widget button(
  BuildContext context, {
  onBtnPress,
  String text,
  double hMargin = 2.5,
  double vMargin = 5,
  double radius = 10,
  double height = 0.06,
  double textSize = 16,
  double width = double.infinity,
  color = blue_sofa,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
    height: MediaQuery.of(context).size.height * height,
    width: width == double.infinity
        ? double.infinity
        : MediaQuery.of(context).size.width * width,
    child: MaterialButton(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Text(text,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
      color: color,
      onPressed: onBtnPress,
    ),
  );
}

Widget appBar(
    {@required String titleText,
    @required color,
    Widget leadingWidget,
    List<Widget> actions}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: color,
    leading: leadingWidget,
    title: Text(
      titleText,
      style: TextStyle(),
    ),
    actions: actions,
  );
}

Widget podcastShadowBox({
  double oPadding = 22,
  double iPadding = 22,
  double fontSize = 30,
  double width = 250,
  String text,
  onPressed,
}) {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.all(oPadding),
        child: CustomPaint(
            painter: MyPainter(),
            child: InkWell(
              onTap: onPressed,
              child: Container(
                width: width,
                padding: EdgeInsets.all(iPadding),
                child: Center(
                  child: Text(text,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            )),
      ),
      Positioned(
        right: 40,
        bottom: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(blurRadius: 4, color: kDarkShadow, spreadRadius: 2)
            ],
          ),
          child: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue[100],
            child: Icon(
              Icons.play_arrow,
              color: base_purple,
              size: 30,
            ),
          ),
        ),
      ),
    ],
  );
}

Card listTileThumbnail() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Center(
        child: Container(
      margin: EdgeInsets.all(5),
      child: Text(
        "Music Industry",
        style: GoogleFonts.poppins(
            fontSize: 10,
            // color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    )),
  );
}

Widget GamesHeading({@required String text, @required Color color, onpressed}) {
  return Container(
    // height: 222,
    child: Stack(children: [
      Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        )),
        // height: 160,
        // width: 160,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(5))),
      ),
      // Positioned(
      //   right: 0,
      //   top: 150,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: color,
      //       shape: BoxShape.circle,
      //       boxShadow: [
      //         BoxShadow(blurRadius: 4, color: Colors.black12, spreadRadius: 2)
      //       ],
      //     ),
      //     child: CircleAvatar(
      //       radius: 20.0,
      //       backgroundColor: color,
      //       child: Icon(
      //         Icons.play_arrow,
      //         color: Colors.white,
      //         size: 30,
      //       ),
      //     ),
      //   ),
      // ),
    ]),
  );
}

// class CustomAppBar extends StatelessWidget {
//   String title;
//   Widget leadingWidget;
//   // FirebaseAuth auth = FirebaseAuth.instance;

//   // UserRepository _userRepository = UserRepository();
//   // String get uID {
//   //   try {
//   //     final uid = (FirebaseAuth.instance.currentUser).uid;
//   //     return uid;
//   //   } catch (e) {
//   //     return "null";
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // CollectionReference users = FirebaseFirestore.instance.collection('users');

//     return FutureBuilder<DocumentSnapshot>(
//         future: users.doc(uID).get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text("Something went wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data = snapshot.data.data();
//             return AppBar(
//               leading: CircleAvatar(
//                 backgroundImage: data['UserData']['profileUrl'] != null
//                     ? NetworkImage((data['UserData']['profileUrl']
//                             .toString()
//                             .contains('google')
//                         ? data['UserData']['profileUrl']
//                             .toString()
//                             .replaceFirst('s96-c', 's300-c')
//                         : data['UserData']['profileUrl'] + '?height=600'))
//                     : AssetImage('assets/profile_placeholder.png'),
//               ),
//               title: Text(title),
//               centerTitle: true,
//               backgroundColor: blue_sofa,
//             );
//           }
//           {
//             return null;
//           }
//         });
//   }
// }

// Widget gamesBottomList({@required String text, @required Color color, onpressed}) {
//   return Container(
//     height: 222,
//     child: Stack(children: [
//       Padding(
//           padding: const EdgeInsets.only(top: 10, left: 10),
//           child: Container(
//             child: Center(
//                 child: Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 text,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.white),
//               ),
//             )),
//             height: 60,
//             width: 160,
//             decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(5),
//                     topRight: Radius.circular(10),
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(5))),
//           )),
//       Positioned(
//         right: 0,
//         top: 150,
//         child: Container(
//           decoration: BoxDecoration(
//             color: color,
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(blurRadius: 4, color: Colors.black12, spreadRadius: 2)
//             ],
//           ),
//           child: CircleAvatar(
//             radius: 20.0,
//             backgroundColor: color,
//             child: Icon(
//               Icons.play_arrow,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//         ),
//       ),
//     ]),
//   );
// }

Widget gamesBottomList(context,
    {@required String title,
    @required Color color,
    @required double height,
    @required double width,
    List nTitle,
    List gameUrl}) {
  return Container(
    
    child: Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Container(
                        // width: 170,
                        margin: EdgeInsets.symmetric(vertical: 12),
                        // height: MediaQuery.of(context).size.height * .32,
                        width: MediaQuery.of(context).size.width * .5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: nTitle.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: gameButton(context,
                                  height: height,
                                  width: width,
                                  title: nTitle[index],
                                  color: blue_sofa, onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameWebview(
                                            gameUrl: gameUrl[index],
                                            gameName: nTitle[index])));
                              }),
                            );
                          },
                        )),
                  );
                });
          },
          child: Stack(children: [
            SizedBox(
              height: height,
              width: width,
              child: Container(
                // margin: const EdgeInsets.all(10),
                child: Container(
                  // width: 200,
                  // color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    softWrap: true,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              // right: 0,
              // top: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4, color: Colors.black12, spreadRadius: 2)
                  ],
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.play_arrow,
                    color: color,
                    size: 15,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

Widget gameButton(context,
    {@required String title,
    @required Color color,
    @required double height,
    @required double width,
    onPressed}) {
  return Container(
    // height: 222,
    child: Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Stack(children: [
            SizedBox(
              height: height,
              width: width,
              child: Container(
                // margin: const EdgeInsets.all(10),
                child: Container(
                  // width: 200,
                  // color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    softWrap: true,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              // right: 0,
              // top: 50,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4, color: Colors.black12, spreadRadius: 2)
                  ],
                ),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.play_arrow,
                    color: color,
                    size: 15,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

courseCard({image, color}) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            image,
            // fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}
