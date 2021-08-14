import 'dart:developer';

import 'package:better_player/better_player.dart';

import 'package:flutter/material.dart';
import 'package:loststoriesacademy/models/singleLesson.dart';
import 'package:loststoriesacademy/services/lessonServices.dart';

class LessonVideoPage extends StatefulWidget {
  final lessonId;
  final title;
  LessonVideoPage({
    @required this.lessonId,
    this.title,
  });
  @override
  _LessonVideoPageState createState() => _LessonVideoPageState();
}

class _LessonVideoPageState extends State<LessonVideoPage> {
  BetterPlayerController _betterPlayerController;

  SingleLesson _lesson;

  Future future;
  Future<SingleLesson> lessonFetch() async {
    SingleLesson data = await LessonServices.getLesson(widget.lessonId);
    log('xxxxxxxxxxxxxxxxxxxx');
    print(data.acf.videoUrl);
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      fullScreenByDefault: true,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        playerTheme: _playerTheme,
      ),
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      data.acf.mediaUrl,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    return data;
  }

  BetterPlayerTheme _playerTheme = BetterPlayerTheme.material;

  @override
  void initState() {
    log(widget.lessonId);
    // lessonFetch();
    // future = lessonFetch().then((value) {
    //   log(value.acf.mediaUrl.toString());

    // });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            FutureBuilder(
                future: lessonFetch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: 16 / 9,
                      child: BetterPlayer(controller: _betterPlayerController),
                    );
                  }
                  {
                    return Container(
                      color: Colors.black,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            
            Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
