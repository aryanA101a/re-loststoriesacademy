import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:loststoriesacademy/repositories/music_player_ui_functions.dart';
import 'package:loststoriesacademy/widget/popUpMenu.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/colors.dart';
import '../../constants/colors.dart';

// context.read<MPUIFunctions>().changeLanguage(lang: 'ENG');

typedef void OnError(Exception exception);
enum PlayerState { stopped, playing, paused }

class PodcastAudioPlayer extends StatefulWidget {
  final Map lang;
  final title;
  final String img;
  PodcastAudioPlayer({this.lang, this.title, this.img});
  @override
  _PodcastAudioPlayerState createState() => _PodcastAudioPlayerState();
}

class _PodcastAudioPlayerState extends State<PodcastAudioPlayer> {
  var audioUrl;

  // Map lang = {
  //   'eng':
  //       "https:\/\/d8skzlz85ruek.cloudfront.net\/wp-content\/uploads\/Podcast-30-Understanding-Sub-Bass.mp3",
  //   'hin':
  //       "https:\/\/d8skzlz85ruek.cloudfront.net\/wp-content\/uploads\/Podcast-30-Understanding-Sub-Bass-Hindi.mp3",
  //   'guj':
  //       "https:\/\/d8skzlz85ruek.cloudfront.net\/wp-content\/uploads\/Podcast-30-Understanding-Sub-Bass-Gujarati.mp3"
  // };
  Duration duration;
  Duration position;

  AudioPlayer audioPlayer;

  String localFilePath;

  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState() {
    log(widget.img.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      audioUrl =
          widget.lang[context.read<MPUIFunctions>().getLanguage.toLowerCase()];
      context.read<MPUIFunctions>().changeValueWithParam(false);
    });

    super.initState();
    initAudioPlayer();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    _positionSubscription = audioPlayer.onAudioPositionChanged
        .listen((p) => setState(() => position = p));
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
      if (s == AudioPlayerState.PLAYING) {
        setState(() => duration = audioPlayer.duration);
      } else if (s == AudioPlayerState.STOPPED) {
        onComplete();
        setState(() {
          position = duration;
        });
      }
    }, onError: (msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration(seconds: 0);
        position = Duration(seconds: 0);
      });
    });
  }

  Future play() async {
    await audioPlayer.play(audioUrl);
    setState(() {
      playerState = PlayerState.playing;
    });
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = Duration();
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MPUIFunctions>(context);

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                // LanguageButton(),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 12,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: base_purple,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          right: 30,
                        ),
                        child: PopupMenuButton(
                          // color: base_purple,

                          child: Card(
                            color: base_purple,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                data.getLanguage,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // shape: RoundedRectangleBorder(
                          // borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(0),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onSelected: (value) {
                            switch (value) {
                              case "GUJ":
                                {
                                  if (audioUrl !=
                                      widget.lang['guj'].replaceAll('\\', '')) {
                                    data.changeLanguage(lang: 'GUJ');
                                    context
                                        .read<MPUIFunctions>()
                                        .changeValueWithParam(true);
                                    var subs;
                                    var seconds = position != null
                                        ? position.inSeconds.toDouble()
                                        : 0.0;
                                    stop();
                                    audioUrl =
                                        widget.lang['guj'].replaceAll('\\', '');
                                    play();
                                    subs = audioPlayer.onPlayerStateChanged
                                        .listen((event) {
                                      if (event == AudioPlayerState.PLAYING) {
                                        audioPlayer.seek(seconds);
                                        subs.cancel();
                                      }
                                    });
                                  }
                                }
                                break;

                              case "HIN":
                                {
                                  if (audioUrl !=
                                      widget.lang['hin'].replaceAll('\\', '')) {
                                    data.changeLanguage(lang: 'HIN');
                                    context
                                        .read<MPUIFunctions>()
                                        .changeValueWithParam(true);

                                    var subs;
                                    var seconds = position != null
                                        ? position.inSeconds.toDouble()
                                        : 0.0;
                                    stop();
                                    audioUrl =
                                        widget.lang['hin'].replaceAll('\\', '');
                                    play();
                                    subs = audioPlayer.onPlayerStateChanged
                                        .listen((event) {
                                      if (event == AudioPlayerState.PLAYING) {
                                        audioPlayer.seek(seconds);
                                        subs.cancel();
                                      }
                                    });
                                  }
                                }
                                break;
                              case "ENG":
                                {
                                  if (audioUrl !=
                                      widget.lang['eng'].replaceAll('\\', '')) {
                                    data.changeLanguage(lang: 'ENG');
                                    context
                                        .read<MPUIFunctions>()
                                        .changeValueWithParam(true);

                                    var subs;
                                    var seconds = position != null
                                        ? position.inSeconds.toDouble()
                                        : 0.0;
                                    stop();
                                    audioUrl =
                                        widget.lang['eng'].replaceAll('\\', '');
                                    play();
                                    subs = audioPlayer.onPlayerStateChanged
                                        .listen((event) {
                                      if (event == AudioPlayerState.PLAYING) {
                                        audioPlayer.seek(seconds);
                                        subs.cancel();
                                      }
                                    });
                                  }
                                }
                                break;
                            }
                          },
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                                value: "ENG",
                                child: Row(
                                  children: [
                                    Text("ENG",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: blue_sofa))
                                  ],
                                )),
                            PopupMenuItem(
                              child: Divider(color: Colors.grey),
                              height: 0,
                            ),
                            PopupMenuItem(
                                value: "HIN",
                                child: Row(
                                  children: [
                                    Text("HIN",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: blue_sofa))
                                  ],
                                )),
                            PopupMenuItem(
                              child: Divider(color: Colors.grey),
                              height: 0,
                            ),
                            PopupMenuItem(
                                value: "GUJ",
                                child: Row(
                                  children: [
                                    Text("GUJ",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: blue_sofa)),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      margin: EdgeInsets.all(23),
                      child: Image.network(widget.img),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2, color: base_purple)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 73),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF413737)),
                  ),
                ),
                Material(
                    child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // if (duration != null)
                      Row(
                        children: [
                          Container(
                            width: position != null
                                ? queryData.size.width * 0.15
                                : queryData.size.width * 0.05,
                            child: Text(
                                position != null
                                    ? "${positionText ?? ''} "
                                    : '',
                                style: GoogleFonts.poppins(color: Colors.grey)),
                          ),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    trackShape: CustomTrackShape(),
                                  ),
                                  child: Slider.adaptive(
                                    activeColor: Color(0xFF6253FF),
                                    inactiveColor: Colors.grey[300],
                                    value: position != null
                                        ? position.inMilliseconds.toDouble()
                                        : 0.0,
                                    onChanged: (double value) {
                                      return audioPlayer
                                          .seek((value / 1000).roundToDouble());
                                    },
                                    min: 0.0,
                                    max: duration != null
                                        ? duration.inMilliseconds.toDouble()
                                        : 1,
                                  ),
                                )),
                          ),
                          Text(
                            position != null
                                ? " ${durationText ?? ''}"
                                : duration != null
                                    ? durationText
                                    : '',
                            style: GoogleFonts.poppins(color: Colors.grey),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: queryData.size.height * 0.1,
                      // ),

                      Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                iconSize: 64.0,
                                icon: Icon(
                                  Icons.skip_previous_rounded,
                                  color: base_purple,
                                ),
                                onPressed: () {}),
                            InkWell(
                              onTap: () {
                                data.changeValue();
                                isPlaying ? pause() : play();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: base_purple,
                                child: data.isPlaying
                                    ? Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                              ),
                            ),
                            IconButton(
                                iconSize: 64.0,
                                icon: Icon(
                                  Icons.skip_next_rounded,
                                  color: base_purple,
                                ),
                                onPressed: () {}),
                          ]),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = 10;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
