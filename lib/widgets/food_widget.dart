import 'package:flutter/material.dart';
import 'package:retro_snake/assets/AssetsColors.dart';

class FoodWidget extends StatelessWidget {
  final double xPosition;
  final double yPosition;
  final double size;

  const FoodWidget({
    super.key,
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
          color: AssetsColors.red,
        ));
  }
}
