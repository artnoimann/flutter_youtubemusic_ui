import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_column_tracks.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_track_in_list.dart';

WidgetBlockColumnsTracks(List<ArtistModel> artistList, int maxColumns, int maxElementInColumn, BuildContext context) {
  if(maxColumns == 0) {
    maxColumns = 1;
  }
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    physics: ClampingScrollPhysics(),
    children: [
      for(var i = 1; i < maxColumns+1; i++)
        WidgetColumnTracks(artistList, maxElementInColumn, i, context),
    ],
  );
}