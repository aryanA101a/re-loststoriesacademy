import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/constants/dimensions.dart';
import 'package:loststoriesacademy/widget/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
          titleText: "Subscription", color: blue_sofa, leadingWidget: null),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
              // margin: EdgeInsets.only(left: 39),
              child: Image.asset(
            'assets/cover_image.png',
            fit: BoxFit.cover,
          )),
          Container(
            padding: EdgeInsets.only(
                left: size.width * 0.1, right: size.width * 0.1),
            child: Column(
              children: [
                Text(
                  "A Plan For Every Student",
                  style: GoogleFonts.poppins(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  """
Choose a plan that works best for you and 
let’s jam together       
                        """,
                  style: GoogleFonts.poppins(
                    fontSize: size.height * 0.01,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.9,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SubsPack(),
                SubsLiveClass(),
                SubStudio(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SubsLiveClass() {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(left: 20, bottom: 30, right: 20),
        height: 460,
        width: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 50),
                      child: Text(
                        "Live Classes",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                          "RS.49,999",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Access to ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                            text: """
recorded live sessions
                            """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.done_rounded,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text("3 Months, 140 Hours+ Training",
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ableton ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                            text: """
racks and presets, Track Promotion
                            """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Freebies ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: 'Freebies Worth ₹10000/-',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => launch(
                      'https://www.loststoriesacademy.com/live-classes/'),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: HexColor("#242430"),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Visit Website",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white)),

                        Image(image: AssetImage("assets/rocket.png"))

                        // Icon(
                        //   Icons.shopping_cart,
                        //   color: Colors.white,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFF0FBC69)),
      ),
      Positioned(
          top: 10,
          right: 40,
          child: Container(
            height: 30,
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "N/A",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: HexColor("#302323"),
                borderRadius: BorderRadius.circular(20)),
          )),
      Positioned(
          top: 40,
          left: 50,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: HexColor("#302323"),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("assets/Group2.png"), fit: BoxFit.cover)),
          ))
    ]);
  }

  Widget SubStudio() {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(left: 20, bottom: 30, right: 20),
        height: 460,
        width: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 50),
                      child: Text(
                        "In The Studiio",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                          "RS.4,30,000",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Access to ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                            text: """
recorded live sessions
                            """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.done_rounded,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text("3 Months, 140 Hours+ Training",
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Ableton ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: """
racks adn presents, Track Promotion
                            """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Freebies ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: 'Freebies Worth ₹10000/-',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => launch(
                      'https://www.loststoriesacademy.com/in-the-studio/music-production-advance-plus/'),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: HexColor("#242430"),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Visit Website",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white)),
                        Image(image: AssetImage("assets/rocket.png"))
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFF3662C1)),
      ),
      Positioned(
          top: 10,
          right: 40,
          child: Container(
            height: 30,
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "N/A",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: HexColor("#302323"),
                borderRadius: BorderRadius.circular(20)),
          )),
      Positioned(
          top: 40,
          left: 50,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: HexColor("#302323"),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("assets/Group2.png"), fit: BoxFit.cover)),
          ))
    ]);
  }
}

class SubsPack extends StatelessWidget {
  const SubsPack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(left: 20, bottom: 30, right: 20),
        height: 460,
        width: 350,
        // height: size.height *0.5,
        // width: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 50),
                      child: Text(
                        "All Access Pack",
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'RS. 649/ ',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: " Month",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Unlimited access to all ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: """
library, courses, ear training games, audio podcast, fourms
                """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.done_rounded,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text("Guest Masterclass, Free Webinars.",
                        style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Unlimited access to all ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: """
library, cources, ear training games, audio podcast, forums
                """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Free ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Premium Samples ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: """
every month
                """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.done_rounded,
                    size: 45,
                    color: Colors.white,
                  ),
                  title: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'New ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'courses added ',
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text: """
every few days
                """,
                            style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => launch('https://www.loststoriesacademy.com/'),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFF312DF4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Visit Website",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white)),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFF1A1C29)),
      ),
      Positioned(
          top: 10,
          right: 40,
          child: Container(
            height: 30,
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Monthly",
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white,
                )
              ],
            ),
            decoration: BoxDecoration(
                color: HexColor("#E75755"),
                borderRadius: BorderRadius.circular(20)),
          )),
      Positioned(
          top: 40,
          left: 40,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: HexColor("#E75755"),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("assets/Group1.png"), fit: BoxFit.cover)),
          ))
    ]);
  }
}
