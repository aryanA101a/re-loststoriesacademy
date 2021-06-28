import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loststoriesacademy/constants/colors.dart';
import 'package:loststoriesacademy/models/ForumTitleList.dart';
import 'package:loststoriesacademy/services/ForumTitleList.dart';
import 'package:loststoriesacademy/widget/widgets.dart';

class ForumTitleList extends StatelessWidget {
  final forumId;

  ForumTitleList({this.forumId});

  List<FourmTitleList> _list;
  Future getFourmWithId() async {
    await FourmTitleListServices.getFourm(forumId).then((value) {
      _list = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(titleText: "", color: blue_sofa),
      body: FutureBuilder(
          future: getFourmWithId(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(_list[0].title.rendered),
                    );
                  });
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
