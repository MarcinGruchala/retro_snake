import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:retro_snake/theme/color_extension.dart';

class PortalWidget extends HookWidget {
  final double xPosition;
  final double yPosition;
  final double size;
  final bool isActive;

  const PortalWidget({
    required this.xPosition,
    required this.yPosition,
    required this.size,
    required this.isActive,
    super.key,
  });

  static const _scaleAnimationSize = 0.6;
  static const _animationDuration = Duration(milliseconds: 700);
  static const _innerCircleScaleFactor = 0.5;

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
          width: size,
          height: size,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.background,
              ),
              width: size * _innerCircleScaleFactor,
              height: size * _innerCircleScaleFactor,
            ),
          ),
        ),
      ),
    );
  }
}
