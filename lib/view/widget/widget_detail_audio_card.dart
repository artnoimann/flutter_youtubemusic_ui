import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';

class WidgetDetailAudioCard extends StatefulWidget {
  ArtistModel objArtist;
  WidgetDetailAudioCard({Key? key, required this.objArtist}) : super(key: key);

  @override
  State<WidgetDetailAudioCard> createState() => _WidgetDetailAudioCardState();
}

class _WidgetDetailAudioCardState extends State<WidgetDetailAudioCard> {
  double _currentSliderValue = 28; //seconds start
  double _maxSliderValue = 242; //seconds delay
  bool isPlayTrack = false;
  bool isLikedTrack = false;
  bool isUnlikedTrack = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Image.network(
            widget.objArtist.src,
            width: 350,
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
                      content: const Text('Is it real? What\'s wrong dude?'),
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
          Slider(
            value: _currentSliderValue,
            max: _maxSliderValue,
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            thumbColor: Colors.white,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  convertIntToMinSec(_currentSliderValue.toInt()),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  convertIntToMinSec(_maxSliderValue.toInt()),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
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
                    setState(() {
                      isPlayTrack = !isPlayTrack;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: "4C3929".toColor(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: isPlayTrack
                          ? Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 70,
                      )
                          : Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 70,
                      )),
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
    );
  }
}
