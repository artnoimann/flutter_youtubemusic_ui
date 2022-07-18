import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackChoice with ChangeNotifier, DiagnosticableTreeMixin {
  String _artistName = '';

  String get artistName => _artistName;

  void change(String artistName) {
    _artistName = artistName;
    notifyListeners();
  }

  /// readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('artistName', artistName));
  }
}

class WidgetTrackInList extends StatefulWidget {
  final ArtistModel artistModel;

  WidgetTrackInList({Key? key, required this.artistModel}) : super(key: key);

  @override
  State<WidgetTrackInList> createState() => _WidgetTrackInListState();
}

class _WidgetTrackInListState extends State<WidgetTrackInList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _trackInfo;

  Future<void> addTrackLicening() async {
    final SharedPreferences prefs = await _prefs;
    // late String trackInfo = '';
    setState((){
      _trackInfo = prefs.setString('trackInfoName', widget.artistModel.name).then((bool success) {
        return widget.artistModel.name;
      });
    });
  }

  @override
  void initState() {
    // addTrackLicening();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          setState((){
            addTrackLicening();
          });
          context.read<TrackChoice>().change(widget.artistModel.name);
          },
        child: SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.artistModel.src,
                        fit: BoxFit.fill,
                        width: 40,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.artistModel.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.artistModel.genre,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.more_vert, color: Colors.grey, size: 15,),
            ],
          ),
        ),
      ),
    );
  }
}