import 'package:flutter/material.dart';

class RetroText extends StatelessWidget {
  final String data;
  final Color? color;
  final double fontSize;

  const RetroText(this.data, {super.key, this.color, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w300,
        fontFamily: 'ArcadeClassic',
      ),
    );
  }
}
