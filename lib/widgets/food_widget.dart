import 'package:flutter/material.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../assets/assets_fonts.dart';

class FoodWidget extends StatefulWidget {
  final double xPosition;
  final double yPosition;
  final double size;
  final int score;

  const FoodWidget({
    Key? key,
    required this.xPosition,
    required this.yPosition,
    required this.size,
    required this.score,
  }) : super(key: key);

  @override
  State createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  static const _scaleAnimationSize = 0.6;
  static const _animationDuration = Duration(milliseconds: 700);
  static const _fontSizeFactor = 0.6;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.xPosition,
      top: widget.yPosition,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double scale = _scaleAnimationSize +
              (_animationController.value * _scaleAnimationSize);
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
          width: widget.size,
          height: widget.size,
          child: Center(
            child: Text(
              widget.score.toString(),
              style: AssetsFonts.p(
                context.colors.background,
                widget.size * _fontSizeFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
