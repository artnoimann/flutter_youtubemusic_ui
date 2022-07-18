import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_genre_column.dart';

WidgetExploreGenreColorBlock(List genresList, int maxColumns, int maxElementInColumn, BuildContext context,){
  if(maxColumns == 0) {
    maxColumns = 1;
  }
  return ListView(
    padding: EdgeInsets.zero,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    physics: ClampingScrollPhysics(),
    children: [
      for(var i = 0; i < maxColumns; i++)
        WidgetGenreColumn(genresList, maxElementInColumn, i, context),
    ],
  );
}