import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/sample_data/artists_list.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';
import 'package:flutter_youtubemusic_ui/view/screen/detail_track_screen.dart';

Route _createRoute(BuildContext context,String artistName, ArtistModel objArtist) {
  List artList =
  getInfoByArtist(artistName, artistList);
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DetailTrackScreen(objArtist: artList[0], wrap: 'audio',),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

WidgetTrackProgressOverBottomBar(BuildContext context, String artistName, bool isPlayTrack) {
  List artList =
  getInfoByArtist(artistName, artistList);
  return InkWell(
    onTap: () {
      Navigator.of(context).push(_createRoute(context, artistName, artList[0]));
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(color: "222222".toColor()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.network(
                artList[0].src,
                width: 50,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${artList[0].name}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${artList[0].genre}',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              isPlayTrack ? Icon(
                Icons.pause,
                color: Colors.white,
              ) : Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    ),
  );
}
