import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/sample_data/video_list.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_popup_screen_video_data_tabs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WidgetDetailVideoCard extends StatefulWidget {
  ArtistModel objArtist;

  WidgetDetailVideoCard({Key? key, required this.objArtist}) : super(key: key);

  @override
  State<WidgetDetailVideoCard> createState() => _WidgetDetailVideoCardState();
}

class _WidgetDetailVideoCardState extends State<WidgetDetailVideoCard> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  bool isPlayTrack = true;
  bool isLikedTrack = false;
  bool isUnlikedTrack = false;

  @override
  void initState() {
    super.initState();
    List videoData = videoDataList
        .where((e) => e['artist'] == widget.objArtist.name)
        .toList();
    _controller = YoutubePlayerController(
      initialVideoId: videoData[0]['videoId'],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  YoutubePlayerController _controllerVideo = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  void _showCupertinoDialog() {
    WidgetPopupVideoDataTabs(
        context, videoDataList
        .where((e) => e['artist'] == widget.objArtist.name)
        .toList(), widget.objArtist);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  // videoProgressIndicatorColor: Colors.amber,
                  // progressColors: ProgressColors(
                  //   playedColor: Colors.amber,
                  //   handleColor: Colors.amberAccent,
                  // ),
                  onReady: () {
                    _controllerVideo.addListener(listener);
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Good choice, well done!'),
                          ),
                        );
                        setState(() {
                          isLikedTrack = !isLikedTrack;
                          if (isUnlikedTrack == true) {
                            isUnlikedTrack = false;
                          }
                        });
                      },
                      child: isLikedTrack
                          ? Icon(
                              Icons.thumb_up,
                              color: Colors.white70,
                            )
                          : Icon(
                              Icons.thumb_up_outlined,
                              color: Colors.white70,
                            ),
                    ),
                    Text(
                      widget.objArtist.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text('Is it real? What\'s wrong dude?'),
                          ),
                        );
                        setState(() {
                          // isLikedTrack = isUnlikedTrack;
                          isUnlikedTrack = !isUnlikedTrack;
                          if (isLikedTrack == true) {
                            isLikedTrack = false;
                          }
                        });
                      },
                      child: isUnlikedTrack
                          ? Icon(
                              Icons.thumb_down,
                              color: Colors.white70,
                            )
                          : Icon(
                              Icons.thumb_down_alt_outlined,
                              color: Colors.white70,
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  widget.objArtist.genre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.shuffle,
                        color: Colors.white70,
                      ),
                      Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: "4C3929".toColor(),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: !_controller.value.isPlaying
                              ? Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                  size: 70,
                                )
                              : Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 70,
                                ),
                        ),
                      ),
                      Icon(
                        Icons.skip_next,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.repeat,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => _showCupertinoDialog(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              height: 80,
              decoration: BoxDecoration(
                color: "222222".toColor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18,),
                  ),
                  Text(
                    'Lyrics',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 18,),
                  ),
                  Text(
                    'Similar',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 18,),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
