import 'package:flutter/material.dart';
import 'package:flutter_youtubemusic_ui/model/artist_model.dart';

WidgetArtistCubeWithGenreName(ArtistModel artistList) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      alignment: Alignment.center,
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              artistList.src,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 5),
          Text(
            artistList.genre,
            maxLines: 3,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            artistList.name,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
