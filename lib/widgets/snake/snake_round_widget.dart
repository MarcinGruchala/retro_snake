import 'package:flutter/material.dart';
import 'package:retro_snake/model/enums/direction.dart';

const radiusFactor = 0.5;

class SnakeRoundWidget extends StatelessWidget {
  final double xPosition;
  final double yPosition;
  final double size;
  final Color color;
  final Direction direction;

  const SnakeRoundWidget({
    super.key,
    required this.xPosition,
    required this.yPosition,
    required this.size,
    required this.direction,
    required this.color,
  });

  BorderRadius getBorderRadiusFromDirection(Direction direction) {
    switch (direction) {
      case Direction.up:
        return BorderRadius.vertical(
          top: Radius.circular(size / radiusFactor),
        );
      case Direction.down:
        return BorderRadius.vertical(
          bottom: Radius.circular(size / radiusFactor),
        );
      case Direction.left:
        return BorderRadius.horizontal(
          left: Radius.circular(size / radiusFactor),
        );
      case Direction.right:
        return BorderRadius.horizontal(
          right: Radius.circular(size / radiusFactor),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: xPosition,
        top: yPosition,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: getBorderRadiusFromDirection(direction),
          ),
          width: size,
          height: size,
        ));
  }
}
