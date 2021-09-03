import 'package:flutter/material.dart';
import 'package:loststoriesacademy/Screens/Subscription/subscription_page.dart';
import 'package:loststoriesacademy/Screens/WebView/ContactUs/Contactus.dart';
import 'package:loststoriesacademy/Screens/WebView/Dijing/Dijing.dart';
import 'package:loststoriesacademy/Screens/WebView/Gold/Gold.dart';
import 'package:loststoriesacademy/Screens/WebView/Live%20Classes/liveclasses.dart';
import 'package:loststoriesacademy/Screens/WebView/TermsAndConditon/TermsAndConditon.dart';
import 'package:loststoriesacademy/Screens/podcast/podcastPage.dart';
import 'package:loststoriesacademy/constants/colors.dart';

import 'package:loststoriesacademy/Screens/WebView/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:loststoriesacademy/models/Userdata.dart';
import 'package:loststoriesacademy/services/shared_serivces.dart';
import 'package:loststoriesacademy/services/userdataservices.dart';
import 'Forums/Forumpage.dart';

class HomePageDrawer extends StatelessWidget {
  UserData data;

  // final UserDataServices userDataServices = UserDataServices();
  Future fetchUserData() async {
    await UserDataServices.dataFetch().then((userdata) {
      data = userdata;
    });
  }

  SharedServices sharedServices = SharedServices();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      child: ListView(
        children: <Widget>[
          FutureBuilder(
              future: fetchUserData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Text(
                      "Something went wrong. Most probably jwt token expired");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  // Map<String, dynamic> data = snapshot.data.data();
                  return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: blue_sofa),
                    arrowColor: Colors.black,
                    //  accountName: Text("${data['userName']}"),
                    accountName: Text("${data.name}"),
                    accountEmail: Text("${data.email}"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).platform == TargetPlatform.iOS
                              ? Colors.white
                              : Colors.blue,
                      // backgroundImage: data['profileUrl'] != null
                      //     ? NetworkImage((data['profileUrl']))
                      //     : AssetImage('assets/profile_placeholder.png'),
                      backgroundImage: data.avatarUrls[96] != null
                          ? NetworkImage(
                              (data.avatarUrls.toString().contains('google')
                                  ? data.avatarUrls
                                      .toString()
                                      .replaceFirst('s96-c', 's300-c')
                                  : '${data.avatarUrls[96]}' + '?height=600'))
                          : AssetImage('assets/profile_placeholder.png'),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Gold()));
            },
            title: Text("Gold"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LiveClasses()));
            },
            title: Text("Live Classes"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Dijing()));
            },
            title: Text("Djing"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForumPage()));
            },
            title: Text("Forum"),
          ),
          ListTile(
            title: Text("Contact Us"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
            },
          ),
          ListTile(
            onTap: () {
              SharedServices.logout(context);
            },
            title: Text("Logout"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SubscriptionPage()));
            },
            title: Text("Subscription"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPloicy()));
            },
            title: Text("Privacy Policy"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsAndConditoon()));
            },
            title: Text("Terms and Conditons"),
          ),
        ],
      ),
    );
  }
}
