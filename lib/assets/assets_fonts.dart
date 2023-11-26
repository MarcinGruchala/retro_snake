import 'package:flutter/material.dart';

class AssetsFonts {
  static TextStyle h1(Color color) => TextStyle(
        color: color,
        fontSize: 40,
        fontWeight: FontWeight.w700,
        fontFamily: 'ArcadeClassic',
      );

  static TextStyle h2(Color color) => TextStyle(
        color: color,
        fontSize: 30,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w700,
        fontFamily: 'ArcadeClassic',
      );

  static TextStyle p1(Color color) => TextStyle(
        color: color,
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w400,
        fontFamily: 'ArcadeClassic',
      );

  static TextStyle p(Color color, double size) => TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
        fontFamily: 'ArcadeClassic',
      );
}
