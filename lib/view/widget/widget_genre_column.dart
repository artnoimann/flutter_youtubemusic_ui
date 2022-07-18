import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/view/widget/widget_explore_genre_element.dart';

WidgetGenreColumn(List genresList, int maxElementInColumn, int offset,
    BuildContext context,){
  if (maxElementInColumn == 0) {
    maxElementInColumn = genresList.length;
  }
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.36,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: maxElementInColumn,
        itemBuilder: (context, index) {
          index = index + (maxElementInColumn*offset);
          return WidgetExploreGenreColorElement(genresList[index]['genre'], genresList[index]['color']);
        },
      ),
    ),
  );
}