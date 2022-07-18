import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/sample_data/artists_list.dart';
import 'package:flutter_youtubemusic_ui/view/screen/init_screen.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_artist_grid_select.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_icon_logo.dart';

class SelectArtist extends StatefulWidget {
  const SelectArtist({Key? key}) : super(key: key);

  @override
  State<SelectArtist> createState() => _SelectArtistState();
}

class _SelectArtistState extends State<SelectArtist> {
  late List<ArtistModel> selectedList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: WidgetIconLogo(14, 22),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 35, right: 35),
                              child: Text(
                                'Select your favorite artists (5)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                'We\'ve added artists you\'ve listened to on youtube here.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 600,
                        alignment: Alignment.center,
                        child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemCount: artistList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) {
                              return ArtistItemSelect(
                                  artistModel: artistList[index],
                                  isSelected: (bool value) {
                                    setState(() {
                                      if (value) {
                                        selectedList.add(artistList[index]);
                                      } else {
                                        selectedList.remove(artistList[index]);
                                      }
                                    });
                                    print("$index : $value");
                                  },
                                  key: Key(artistList[index].name.toString()));
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          (selectedList.length > 4) ? AnimatedContainer(
            color: Colors.red.withOpacity(0),
            duration: Duration(seconds: 3),
            curve: Curves.fastLinearToSlowEaseIn,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                    ),
                Positioned(
                  bottom: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InitScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'OK',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}
