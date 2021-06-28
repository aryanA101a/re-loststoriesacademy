import 'package:flutter/material.dart';

import 'package:loststoriesacademy/models/podcastlist.dart';
import 'package:loststoriesacademy/services/podcastListService.dart';


class JsonTesting extends StatefulWidget {
  @override
  _JsonTestingState createState() => _JsonTestingState();
}

class _JsonTestingState extends State<JsonTesting> {
  List<PodcastsLists> _podcastLists;
  
  bool _loading;
  @override
  void initState() {
    super.initState();
    PodcastsListsServices.getPodcastsLists().then((podcastsLists) {
      _podcastLists = podcastsLists.cast<PodcastsLists>();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? "Loading....." : "Podcasts"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: _podcastLists.length,
            itemBuilder: (context, index) {
              PodcastsLists podcastsLists = _podcastLists[index];
              return ListTile(
                title: Text(podcastsLists.title.rendered.split("; ")[1]),
                subtitle: Text(podcastsLists.link),
              );
            }
            ),
      ),
    );
  }
}
