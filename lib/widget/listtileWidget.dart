import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

import '../constants/colors.dart';



class PodcastListTile extends StatelessWidget {
  PodcastListTile({
    // @required this.thumbnail,
    @required this.title,
    @required this.subtitle,
    // @required this.height,
    @required this.onTap,
  });

  // final Widget thumbnail;
  final String title;
  final String subtitle;
  // final double height;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
              tileColor: blue_sofa,
              leading: SizedBox(
                  height: 50,
                  // width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://d8skzlz85ruek.cloudfront.net/wp-content/uploads/1-Music-Industry.jpg',
                    ),
                  )),
              title: Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.white70,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                        ),
                      ))
                ],
              ),
              trailing: InkWell(
                onTap: onTap,
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
          ),
        ),
      ),
    );
  }
}

class LessonListTile extends StatelessWidget {
  LessonListTile({
    // @required this.thumbnail,
    @required this.title,
    @required this.subtitle,
    // @required this.height,
    @required this.onTap,
  });

  // final Widget thumbnail;
  final String title;
  final String subtitle;
  // final double height;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ListTile(
              contentPadding:
                  EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
              tileColor: blue_sofa,
              
              title: Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.white70,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                        ),
                      ))
                ],
              ),
              trailing: InkWell(
                onTap: onTap,
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
          ),
        ),
      ),
    );
  }
}