import 'package:flutter/material.dart';

class SnakeBodyPartWidget extends StatelessWidget {
  final Color color;
  final double xPosition;
  final double yPosition;
  final double size;

  const SnakeBodyPartWidget({
    super.key,
    required this.color,
    required this.xPosition,
    required this.yPosition,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: xPosition,
        top: yPosition,
        child: Container(
          width: size,
          height: size,
          color: color,
        ));
  }
}
