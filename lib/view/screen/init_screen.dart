import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/sample_data/artists_list.dart';
import 'package:flutter_youtubemusic_ui/sample_data/bottombar_list.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_track_in_list.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_track_progress_over_bottombar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _page = 0;
  late PageController pageController;
  var _trackInfo;
  bool isPlayTrack = true;

  @override
  void initState() {
    super.initState();
    _trackInfo = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('trackInfoName');
    });
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CoinDrawer(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: routesBottomNavigationBar,
      ),
      backgroundColor: "222222".toColor(),
      persistentFooterButtons: [
        Column(
          children: [
            context.watch<TrackChoice>().artistName != null
                ? WidgetTrackProgressOverBottomBar(context, context.watch<TrackChoice>().artistName, isPlayTrack)
                : SizedBox(),
            _trackInfo != null &&
                    context.watch<TrackChoice>().artistName == null
                ? FutureBuilder(
                        future: _trackInfo,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const CircularProgressIndicator();
                            default:
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return WidgetTrackProgressOverBottomBar(context, snapshot.data, isPlayTrack);
                              }
                          }
                        })
                : SizedBox(),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.grey,
              color: Colors.white,
              minHeight: 1,
            ),
          ],
        ),
      ],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        showUnselectedLabels: true,
        onTap: navigationTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            label: 'Library',
          ),
        ],
        backgroundColor: "222222".toColor(),
      ),
    );
  }
}
