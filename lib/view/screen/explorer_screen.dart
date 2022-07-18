import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/sample_data/artists_list.dart';
import 'package:flutter_youtubemusic_ui/sample_data/genres_colors_list.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_artist_cube_with_genre_name.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_explore_genre_color_block.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_icon_logo.dart';

class ExplorerScreen extends StatefulWidget {
  const ExplorerScreen({Key? key}) : super(key: key);

  @override
  State<ExplorerScreen> createState() => _ExplorerScreenState();
}

class _ExplorerScreenState extends State<ExplorerScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.music_note_outlined,
                color: Colors.white,
              ),
              title: Text(
                'New tracks',
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
                Icons.show_chart,
                color: Colors.white,
              ),
              title: Text(
                'Popular tracks',
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
                Icons.emoji_emotions_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Moods and genres',
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
            Divider(color: Colors.grey.withOpacity(0.8)),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Text(
                      'New albums and singles',
                      style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    width: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      'more',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8), fontSize: 17),
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
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return WidgetArtistCubeWithGenreName(artistList[index + 4]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Moods and genres',
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
                          color: Colors.white.withOpacity(0.8), fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 300,
              child: WidgetExploreGenreColorBlock(genresColorsList, 3, 3, context),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15),
            //   child: SizedBox(
            //     height: 200,
            //     child: GridView.count(
            //         shrinkWrap: true,
            //         crossAxisCount: 3,
            //         physics: const ClampingScrollPhysics(),
            //         scrollDirection: Axis.horizontal,
            //         crossAxisSpacing: 3,
            //         mainAxisSpacing: 10,
            //         children: [
            //           for (var i = 0; i < genresColorsList.length; i++)
            //             Container(
            //                 height: 75,
            //                 width: 250,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                 ),
            //                 child: Row(
            //                   children: [
            //                     Container(
            //                         width: 8,
            //                         height: 50,
            //                         color: genresColorsList[i]['color']
            //                             .toString()
            //                             .toColor(),
            //                       ),
            //                     Container(
            //                         width: 170,
            //                         height: 50,
            //                         alignment: Alignment.centerLeft,
            //                         decoration: BoxDecoration(color: Colors.brown),
            //                         child: Padding(
            //                           padding: const EdgeInsets.only(left: 10),
            //                           child: Text(
            //                               genresColorsList[i]['genre'],
            //                               style: TextStyle(color: Colors.white,
            //                               ),
            //                             ),
            //                         ),
            //                       ),
            //                   ],
            //                 ),
            //               ),
            //         ]),
            //   ),
            // ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
