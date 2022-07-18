import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_track_in_list.dart';

WidgetColumnTracks(List<ArtistModel> artistList, int maxElementInColumn, int offset,
    BuildContext context,) {
  if (maxElementInColumn == 0) {
    maxElementInColumn = artistList.length;
  }
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: maxElementInColumn,
        itemBuilder: (context, index) {
          index = index + (maxElementInColumn*offset);
          return WidgetTrackInList(artistModel: artistList[index]);
        },
      ),
    ),
  );
}
