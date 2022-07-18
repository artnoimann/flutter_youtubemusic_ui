import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class WidgetVideoPlayer extends StatefulWidget {
  final String videoUrl;

  WidgetVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<WidgetVideoPlayer> createState() => _WidgetVideoPlayerState();
}

class _WidgetVideoPlayerState extends State<WidgetVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setVolume(1);
        videoPlayerController.setLooping(true);
      });
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
