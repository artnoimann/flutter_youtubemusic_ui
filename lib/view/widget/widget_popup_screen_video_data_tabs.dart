import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/sample_data/video_list.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';
import 'package:flutter_youtubemusic_ui/view/screen/detail_track_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

WidgetPopupVideoDataTabs(
    BuildContext context, List videoData, ArtistModel objArtist) {
  _dismissDialog() {
    Navigator.pop(context);
  }

  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 40,
          // padding: EdgeInsets.only(top: 20, bottom: 30),
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Image.network(
                              'https://img.youtube.com/vi/${videoData[0]['videoId']}/0.jpg',
                              width: 50,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                objArtist.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 5),
                              Text(
                                objArtist.genre,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.skip_next,
                            color: Colors.white,
                          ),
                          SizedBox(width: 15),
                          Material(
                            child: InkWell(
                              onTap: () => _dismissDialog(),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                      ),
                      color: "222222".toColor(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 10),
                            AnimatedContainer(
                              // Use the properties stored in the State class.
                              width: 110,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // Define how long the animation should take.
                              duration: const Duration(seconds: 1),
                              // Provide an optional curve to make the animation feel smoother.
                              curve: Curves.fastOutSlowIn,
                            ),
                          ],
                        ),
                        Text(
                          'Lyrics',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Similar',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.height - 215,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: "222222".toColor(),
                    ),
                    child: Material(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: videoDataList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ListTile(
                              tileColor: videoDataList[index]['artist'] ==
                                      objArtist.name
                                  ? '373737'.toColor()
                                  : "222222".toColor(),
                              leading: Image.network(
                                'https://img.youtube.com/vi/${videoDataList[index]['videoId']}/0.jpg',
                                width: 50,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                videoDataList[index]['artist'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                videoDataList[index]['song'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: Icon(
                                Icons.menu,
                                color: Colors.grey,
                              ),
                          );
                        },
                      ),
                      color: "222222".toColor(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
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
