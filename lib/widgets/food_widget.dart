import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../assets/assets_fonts.dart';

class FoodWidget extends HookWidget {
  final double xPosition;
  final double yPosition;
  final double size;
  final int score;
  final bool isActive;

  const FoodWidget({
    Key? key,
    required this.xPosition,
    required this.yPosition,
    required this.size,
    required this.score,
    required this.isActive,
  }) : super(key: key);

  static const _scaleAnimationSize = 0.6;
  static const _animationDuration = Duration(milliseconds: 700);
  static const _fontSizeFactor = 0.6;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: _animationDuration,
    );

    useEffect(
      () {
        if (isActive) {
          animationController.repeat(reverse: true);
        } else {
          animationController.reset();
        }
        return null;
      },
      [isActive],
    );

    return Positioned(
      left: xPosition,
      top: yPosition,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          double scale = _scaleAnimationSize +
              (animationController.value * _scaleAnimationSize);
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colors.primary,
          ),
          padding: const EdgeInsets.all(1),
          width: size,
          height: size,
          child: Center(
            child: Text(
              score.toString(),
              style: AssetsFonts.p(
                context.colors.background,
                size * _fontSizeFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
