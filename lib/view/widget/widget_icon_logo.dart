import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

WidgetIconLogo(double iconSize, double textSize) {
  return Row(
    children: [
      Container(
        padding: EdgeInsets.all(7),
        child: Container(
          child: Icon(
            Icons.play_arrow,
            size: iconSize,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      SizedBox(width: 10),
      Text(
        'Music',
        style: GoogleFonts.oswald(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: textSize,
        ),
      ),
    ],
  );
}