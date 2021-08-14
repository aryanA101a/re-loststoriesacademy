import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loststoriesacademy/Screens/Courses/coursesListPage.dart';
import 'package:loststoriesacademy/Screens/bottom_nav_bar/navbar_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loststoriesacademy/Screens/games/Games.dart';
import 'package:loststoriesacademy/Screens/podcast/podcastPage.dart';
import 'package:loststoriesacademy/Screens/profile_page/Profile.dart';
import 'package:loststoriesacademy/constants/colors.dart';

class NavBar extends StatefulWidget {
  final paraPage;
  NavBar({this.paraPage});
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pages = [CoursesListPage(), PodcastPage(), GamesPage(), Profile()];

  // int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    var navProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: pages,
      ),
     
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: FittedBox(
              child: GNav(
                  rippleColor: Colors.grey[300],
                  hoverColor: Colors.grey[100],
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 300),
                  tabBackgroundColor: Colors.grey[100],
                  tabs: [
                    GButton(
                      icon: Icons.home_outlined,
                      text: 'Home',
                      iconActiveColor: blue_sofa,
                      textColor: blue_sofa,
                    ),
                    GButton(
                      icon: FontAwesomeIcons.podcast,
                      text: 'Podcast',
                      iconActiveColor: blue_sofa,
                      textColor: blue_sofa,
                    ),
                    GButton(
                      icon: FontAwesomeIcons.gamepad,
                      text: 'Games',
                      iconActiveColor: blue_sofa,
                      textColor: blue_sofa,
                    ),
                    GButton(
                      iconActiveColor: blue_sofa,
                      textColor: blue_sofa,
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: 0,
                  onTabChange: (index) {
                    navProvider.changeIndex(index);
                    _pageController.jumpToPage(index);
                    // setState(() {
                    //   _selectedIndex = index;
                    // });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
