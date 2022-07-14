




import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlsOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  static const allSpeeds = <double>[0.25, 0.5, 1, 1.5, 2, 3, 5, 10];

  const ControlsOverlayWidget(
      {Key? key, required VideoPlayerController this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () =>
    controller.value.isPlaying ? controller.pause() : controller.play(),
    child: Stack(
      children: [Positioned(left: 0, right: 0, bottom: 0, child: buildProgressIndicator()),
        buildPlay(),
        buildSpeed(),
        Positioned(
          left: 8,
          bottom: 28,
          child: Text(getPosition()),
        ),
      ],
    ),
  );

  Widget buildProgressIndicator() {
    return VideoProgressIndicator(controller, allowScrubbing: true);
  }

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
      alignment: Alignment.center,
      color: Colors.black26,
      child: Icon(Icons.play_arrow, color: Colors.white, size: 80));

  buildSpeed() {
    return Align(
      alignment: Alignment.topRight,
      child: PopupMenuButton<double>(
        initialValue: controller.value.playbackSpeed,
        tooltip: 'Playback speed',
        onSelected: controller.setPlaybackSpeed,
        itemBuilder: (context) => allSpeeds
            .map<PopupMenuEntry<double>>((speed) => PopupMenuItem(
          value: speed,
          child: Text('${speed}x'),
        ))
            .toList(),
        child: Container(
          color: Colors.white38,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Text('${controller.value.playbackSpeed}x'),
        ),
      ),
    );

  }

  String getPosition() {
    final duration = Duration(
        milliseconds: controller.value.position.inMilliseconds.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }


}