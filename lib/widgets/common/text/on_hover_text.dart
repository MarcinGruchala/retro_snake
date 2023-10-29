import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../../../assets/assets.dart';
import '../child_widget_size.dart';

final _isHoveredProvider = StateProvider<bool>((ref) => false);
final _sizeProvider = StateProvider<Size>((ref) => const Size(0, 0));

class OnHoverText extends ConsumerWidget {
  final String text;

  const OnHoverText({super.key, required this.text});

  static final _defaultTransform = Matrix4.identity();
  static const _animationDuration = Duration(milliseconds: 200);
  static const double _scaleFactor = 1.2;
  static const double _translateCorrection = 2.5; // Picked experimentally
  static const double _letterAvatarWidth = 14; // Picked experimentally
  static const double _underlineHeight = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(_isHoveredProvider);
    final size = ref.watch(_sizeProvider);
    final translateX = ((size.width * _scaleFactor) - size.width);
    final hoverTransform = Matrix4.identity()
      ..scale(_scaleFactor)
      ..translate(-translateX / _translateCorrection);

    return MouseRegion(
      onEnter: (_) => ref.read(_isHoveredProvider.notifier).state = true,
      onExit: (_) => ref.read(_isHoveredProvider.notifier).state = false,
      child: Column(
        children: [
          AnimatedContainer(
            duration: _animationDuration,
            transform: isHovered ? hoverTransform : _defaultTransform,
            child: ChildWidgetSize(
              whenMeasured: (size) {
                ref.read(_sizeProvider.notifier).state = size;
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
              width: isHovered ? text.length * _letterAvatarWidth : 0,
              color: context.colors.primary,
            ),
          )
        ],
      ),
    );
  }
}
