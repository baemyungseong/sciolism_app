import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import 'controls_overlay.dart';

class VideoPlayerPage extends StatefulWidget {
  late String path;
  VideoPlayerPage(this.path, {Key? key}) : super(key: key);
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.path)
      ..addListener(() {setState(() {});})
      ..setLooping(true)
      ..initialize().then((_) => _controller.play());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? Container(alignment: Alignment.topCenter, child: buildVideo())
              : Container(child: const CircularProgressIndicator()),
        )
      ),
    );
  }

  Widget buildVideo() {
    return Stack(children: [
      buildVideoPlayer(),
      Positioned.fill(child: ControlsOverlayWidget(controller: _controller)),
    ]);
  }

  AspectRatio buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

