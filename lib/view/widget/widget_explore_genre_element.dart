import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/utils/functions.dart';

WidgetExploreGenreColorElement(String genre, String color) {
  if(genre == null && color == null) {
    return SizedBox();
  }
  return Container(
    height: 75,
    child: Row(
      children: [
        Container(
          width: 8,
          height: 50,
          color: color
              .toString()
              .toColor(),
        ),
        Container(
          width: 130,
          height: 50,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(color: "292929".toColor()),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              genre,
              style: TextStyle(color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
      ],
    ),
  );
}