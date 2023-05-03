import 'package:flutter/material.dart';
import 'package:retro_snake/assets/assets_colors.dart';

class FoodWidget extends StatefulWidget {
  final double xPosition;
  final double yPosition;
  final double size;

  static const scaleAnimationSize = 0.6;

  const FoodWidget({
    Key? key,
    required this.xPosition,
    required this.yPosition,
    required this.size,
  }) : super(key: key);

  @override
  State createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
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
          double scale = FoodWidget.scaleAnimationSize +
              (_animationController.value * FoodWidget.scaleAnimationSize);
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AssetsColors.black,
          ),
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
