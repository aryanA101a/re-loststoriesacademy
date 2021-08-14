import 'package:flutter/material.dart';
import 'package:loststoriesacademy/models/reviews.dart';
import 'package:loststoriesacademy/services/lessonServices.dart';

class ReviewsTab extends StatelessWidget {
  final courseId;
  ReviewsTab({this.courseId});
  Future<Reviews> reviewsFetch() async {
    Reviews data = await LessonServices.getReviews(courseId);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: reviewsFetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Reviews data = snapshot.data;

              return data.posts.isNotEmpty
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: data.posts.length,
                      itemBuilder: (context, index) {
                        return Wrap(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(data.posts[index].avatarUrl),
                              ),
                              title: RichText(
                                  text: TextSpan(
                                      text: data.posts[index].user,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: ' | ${data.posts[index].time}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal))
                                  ])),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(('⭐' * data.posts[index].mark) +
                                    '\n${data.posts[index].content}'),
                              ),
                              // contentPadding: EdgeInsets.all(18),
                              // trailing: Text(),
                            ),
                            Divider(
                              height: 0,
                            ),
                          ],
                        );
                      })
                  : Center(child: Text('No Reviews'));
            }
            {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }
}
