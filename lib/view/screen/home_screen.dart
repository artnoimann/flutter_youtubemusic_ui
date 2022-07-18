import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/sample_data/artists_list.dart';
import 'package:flutter_youtubemusic_ui/sample_data/image_background_theme.dart';
import 'package:flutter_youtubemusic_ui/sample_data/music_theme.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_artist_cube_with_genre_name.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_icon_logo.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_block_columns_track.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String themeBackKey = 'default';
  late int indexTheme =
      imageThemeBackground.indexWhere((f) => f['theme'] == themeBackKey);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // scrolledUnderElevation: 20,
        title: WidgetIconLogo(14, 22),
        automaticallyImplyLeading: false,
        actions: [
          Icon(
            Icons.monitor,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.person_pin,
            color: Colors.white,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        // padding: EdgeInsets.fromLTRB(15, 40, 15, 5),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: 0.4,
            image: NetworkImage(
              imageThemeBackground[indexTheme]['src'],
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 110, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: musicThemeList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  indexTheme = imageThemeBackground.indexWhere(
                                      (f) => f['theme'] == themeBackKey);
                                  themeBackKey = musicThemeList[index];
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  width:
                                      musicThemeList[index].length.toDouble() *
                                          11,
                                  decoration: imageThemeBackground[indexTheme]
                                              ['theme'] !=
                                          musicThemeList[index]
                                      ? BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.white
                                                  .withOpacity(0.2)),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        )
                                      : BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 0),
                                    child: Text(
                                      musicThemeList[index],
                                      style: TextStyle(
                                        color: imageThemeBackground[indexTheme]
                                                    ['theme'] !=
                                                musicThemeList[index]
                                            ? Colors.white.withOpacity(0.9)
                                            : Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mix for you',
                            style: TextStyle(
                                fontSize: 29,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Text(
                              'more',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: artistList.length,
                          itemBuilder: (context, index) {
                            return WidgetArtistCubeWithGenreName(
                                artistList[index]);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Create a radio based on a track',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Selections by track',
                        style: TextStyle(
                            fontSize: 29,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child:
                          WidgetBlockColumnsTracks(artistList, 2, 4, context),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Favorite artist',
                        style: TextStyle(
                            fontSize: 29,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return WidgetArtistCubeWithGenreName(
                                artistList[index + 3]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
