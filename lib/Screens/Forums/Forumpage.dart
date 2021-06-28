import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/Screens/Forums/ForumTitleList.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/models/FourmsList.dart';
import 'package:loststoriesacademy/services/ForumServices.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  List<FourmList> _fourmList;

  Future fourmListfetch() async {
    await FourmListsServices.getFourmList().then((value) {
      _fourmList = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(titleText: "Fourm", color: blue_sofa, leadingWidget: null),
      body: FutureBuilder(
          future: fourmListfetch(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Categories",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                        ),
                        Text(
                          "Explore awesome thereads in these ctegories of fourms",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: size.height * 0.23,
                      //  height: 190,
                      child: Container(
                          child: ListView.builder(
                              itemCount: _fourmList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return FourmCategory(
                                  context: context,
                                  text: _fourmList[index].title.rendered,
                                  color: Colors.amber,
                                  img: _fourmList[index]
                                      .embedded
                                      .wpFeaturedmedia[0]
                                      .sourceUrl,
                 
                                onpressed: (){
                                       Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForumTitleList(
                                forumId: _fourmList[index].id,
                              ),
                            ));
                                }
                                );
                              }))),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Catch up on the trending threads.",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  // ListView.builder(
                  //     itemCount: 5,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (context, index) {
                  //       return Card(
                  //         child: ListTile(
                  //           title: _fourmList[index].links.,

                  //         ));
                  //     })
                ],
              );
            }
            {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}

Widget FourmCategory(
    {@required String text,
    @required Color color,
    onpressed,
    String img,
    BuildContext context}) {
  return InkWell(
    onTap: onpressed,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Stack(alignment: Alignment.bottomRight, children: [
        Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(5))),
            )),
        Container(
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              radius: 30.0, 
              backgroundColor: color, 
              child: Image.network(img)),
        ),
      ]),
    ),
  );
}
