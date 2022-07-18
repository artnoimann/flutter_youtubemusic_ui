import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/sample_data/artists_list.dart';

extension ColorExtension on String {
  toColor() {
    var hexString = this;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

List getInfoByArtist(String artistName, List<ArtistModel> artistList) {
  List<ArtistModel> tmpList = [];
  for(int i = 0; i < artistList.length; i++) {
    if(artistList[i].name.toLowerCase().contains(artistName.toLowerCase())) {
      tmpList.add(artistList[i]);
    }
  }
  return tmpList;
}

convertIntToMinSec(int n)
{
  int minutes = (n / 60).toInt();

  int seconds = (n-minutes*60).toInt();
  String secondsString = '';
  if(seconds.toInt()<10){
    secondsString = "0"+seconds.toString();
  } else {
    secondsString = seconds.toString();
  }

  return "$minutes:$secondsString";
}
