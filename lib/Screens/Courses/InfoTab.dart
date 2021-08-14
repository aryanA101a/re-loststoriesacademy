import 'package:flutter/material.dart';
import 'package:loststoriesacademy/models/lessons.dart';

class InfoTab extends StatelessWidget {
  final List<MetaElement> info;
  InfoTab({this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return info != null
              ? Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: RichText(
                          text: TextSpan(
                              text: '${info[index].label}: ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                            TextSpan(
                                text: info[index].text,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ])),
                    ),
                    Divider(
                      height: 0,
                    ),
                  ],
                )
              : Container(
                  child: Text('No info available'),
                );
        },
      ),
    );
  }
}
