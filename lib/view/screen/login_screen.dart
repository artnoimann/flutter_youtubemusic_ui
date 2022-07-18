import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/view/screen/select_favorite_artist.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_icon_logo.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_video_player.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          WidgetVideoPlayer(
              videoUrl:
                  'https://assets.mixkit.co/videos/preview/mixkit-silhouette-of-a-person-in-a-projection-of-many-lights-3922-large.mp4'),
          Positioned(
            bottom: 415,
            child: WidgetIconLogo(25, 35),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person_pin,
                      size: 45,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Hello, my favorite username!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      'myfavorite@gmail.com',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectArtist(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Continue as Username',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Change account',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
