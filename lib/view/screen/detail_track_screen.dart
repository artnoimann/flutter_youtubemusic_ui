import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_detail_audio_card.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_detail_video_card.dart';

class DetailTrackScreen extends StatefulWidget {
  ArtistModel objArtist;
  String wrap;

  DetailTrackScreen({Key? key, required this.objArtist, required this.wrap}) : super(key: key);

  @override
  State<DetailTrackScreen> createState() => _DetailTrackScreenState();
}

class _DetailTrackScreenState extends State<DetailTrackScreen> {
  bool audioWrap = true;
  bool videoWrap = false;

  @override
  Widget build(BuildContext context) {
    if(widget.wrap == 'video'){
      audioWrap = false;
      videoWrap = true;
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
          child: Container(
            width: 160,
            height: 34,
            decoration: BoxDecoration(
              color: "251D13".toColor(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                  decoration: audioWrap
                      ? BoxDecoration(
                          color: "34220D".toColor(),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        audioWrap = !audioWrap;
                        if (videoWrap == true) {
                          videoWrap = false;
                        }
                      });
                    },
                    child: Text(
                      'Audio',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                  decoration: videoWrap
                      ? BoxDecoration(
                          color: "34220D".toColor(),
                          borderRadius: BorderRadius.circular(15),
                        )
                      : BoxDecoration(),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        videoWrap = !videoWrap;
                        if (audioWrap == true) {
                          audioWrap = false;
                        }
                      });
                    },
                    child: Text(
                      'Video',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          SizedBox(width: 10),
        ],
        backgroundColor: "2A2117".toColor(),
        elevation: 0,
      ),
      backgroundColor: "2A2117".toColor(),
      body: audioWrap
          ? WidgetDetailAudioCard(objArtist: widget.objArtist)
          : WidgetDetailVideoCard(objArtist: widget.objArtist),
    );
  }
}
