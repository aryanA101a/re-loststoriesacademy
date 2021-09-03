import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/profile_page/editProfile.dart';
import 'package:loststoriesacademy/constants/dimensions.dart';
import 'package:loststoriesacademy/models/Userdata.dart';

import 'package:loststoriesacademy/services/userdataservices.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>
    with AutomaticKeepAliveClientMixin<Profile> {
  UserData data;

  // final UserDataServices userDataServices = UserDataServices();
  Future fetchUserData() async {
    await UserDataServices.dataFetch().then((userdata) {
      data = userdata;
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: fetchUserData(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child:
                  Text("Something went wrong. Most probably jwt token expired"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              start,
                              end,
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.85,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.75,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                )),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return EditProfile(
                                                            name: data.name,
                                                            username:
                                                                data.email,
                                                            imageUrl: data
                                                                .avatarUrls[96],
                                                          );
                                                        },
                                                      )
                                                          .then((value) {})
                                                          .then((value) {
                                                        setState(() {});
                                                      });
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                        top: 25,
                                                        right: 25,
                                                        bottom: 5,
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      // height: 30,
                                                      // width: 40,
                                                      child: Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.white,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                          color: pcolor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)
                                                          // border: Border.all(15)
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Text(
                                                      //   "name",
                                                      data.name ?? "Name",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  child: Text("${data.email}",
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: hBox2,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("6.9k+",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15)),
                                                        Text("Community Post")
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("6.9k+",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15)),
                                                        Text("Audio Uploaded")
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Divider(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: size.height * .175,
                                  width: size.width * .36,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                      image: DecorationImage(
                                          image: data.avatarUrls[96] != null
                                              ? NetworkImage((data.avatarUrls
                                                      .toString()
                                                      .contains('google')
                                                  ? data.avatarUrls
                                                      .toString()
                                                      .replaceFirst(
                                                          's96-c', 's300-c')
                                                  : '${data.avatarUrls[96]}' +
                                                      '?height=600'))
                                              : AssetImage(
                                                  'assets/profile_placeholder.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8, right: 10),
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.white,
                                onPressed: () {},
                                child: Text('Limited Access',
                                    style: GoogleFonts.poppins(
                                        color: pcolor,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
          }
          {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
