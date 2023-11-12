import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../../assets/assets.dart';
import 'child_widget_size.dart';

class OnHoverText extends HookConsumerWidget {
  final String text;
  final TextStyle? style;
  final bool isConstantlyHovered;

  const OnHoverText({
    super.key,
    required this.text,
    this.style,
    this.isConstantlyHovered = false,
  });

  static final _defaultTransform = Matrix4.identity();
  static const _animationDuration = Duration(milliseconds: 200);
  static const double _scaleFactor = 1.2;
  static const double _underlieScaleFactor = 1.4;
  static const double _translateCorrection = 2.5; // Picked experimentally
  static const double _underlineHeight = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(isConstantlyHovered);
    final size = useState(Size.zero);
    useEffect(
      () {
        isHovered.value = isConstantlyHovered;
        return null;
      },
      [isConstantlyHovered],
    );

    final translateX = ((size.value.width * _scaleFactor) - size.value.width);
    final hoverTransform = Matrix4.identity()
      ..scale(_scaleFactor)
      ..translate(-translateX / _translateCorrection);

    return MouseRegion(
      onEnter: (_) {
        if (isConstantlyHovered) return;
        isHovered.value = true;
      },
      onExit: (_) {
        if (isConstantlyHovered) return;
        isHovered.value = false;
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: _animationDuration,
            transform: isHovered.value ? hoverTransform : _defaultTransform,
            child: ChildWidgetSize(
              whenMeasured: (newSize) {
                size.value = newSize;
              },
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: AssetsFonts.p1(context.colors.primary),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: AnimatedContainer(
              duration: _animationDuration,
              height: _underlineHeight,
              width:
                  isHovered.value ? size.value.width * _underlieScaleFactor : 0,
              color: context.colors.primary,
            ),
          )
        ],
      ),
    );
  }
}
