import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String path;

  VideoPlayerScreen({Key key, @required this.path}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(
        path: this.path,
      );
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFeature;
  final String path;

  _VideoPlayerScreenState({Key key, @required this.path});

  @override
  void initState() {
    _controller = VideoPlayerController.asset(path);
    _initializeVideoPlayerFeature = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeVideoPlayerFeature,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }
}
