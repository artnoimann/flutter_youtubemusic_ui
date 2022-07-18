import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_icon_logo.dart';

class LibScreen extends StatefulWidget {
  const LibScreen({Key? key}) : super(key: key);

  @override
  State<LibScreen> createState() => _LibScreenState();
}

class _LibScreenState extends State<LibScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "222222".toColor(),
        elevation: 0,
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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.playlist_play,
              color: Colors.white,
            ),
            title: Text(
              'Playlists',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 16,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.album_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Albums',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 16,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.audiotrack_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Tracks',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 16,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.queue_music_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Artists',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 16,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.my_library_music,
              color: Colors.white,
            ),
            title: Text(
              'Subscribes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
