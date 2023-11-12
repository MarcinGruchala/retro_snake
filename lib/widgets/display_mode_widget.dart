import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../assets/assets.dart';
import '../model/enums/display_mode.dart';
import '../provider/display_mode.dart';
import 'common/ink_well_transparent.dart';
import 'common/on_hover_text.dart';

class DisplayModeWidget extends ConsumerWidget {
  const DisplayModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDisplayMode = ref.watch(displayModeProvider);

    return Container(
      width: 200,
      decoration: blackFrame(context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AssetsStrings.displayMode,
            style: AssetsFonts.h2(context.colors.primary),
          ),
          const SizedBox(height: 20),
          DisplayModeItem(
            onTap: () {
              ref.read(displayModeProvider.notifier).state = DisplayMode.dark;
            },
            text: AssetsStrings.displayModeDark,
            isSelected: currentDisplayMode == DisplayMode.dark,
          ),
          const SizedBox(height: 20),
          DisplayModeItem(
            onTap: () {
              ref.read(displayModeProvider.notifier).state = DisplayMode.light;
            },
            text: AssetsStrings.displayModeLight,
            isSelected: currentDisplayMode == DisplayMode.light,
          ),
          const SizedBox(height: 20),
          DisplayModeItem(
            onTap: () {
              ref.read(displayModeProvider.notifier).state =
                  DisplayMode.classic;
            },
            text: AssetsStrings.displayModeClassic,
            isSelected: currentDisplayMode == DisplayMode.classic,
          ),
        ],
      ),
    );
  }
}

class DisplayModeItem extends ConsumerWidget {
  final Function() onTap;
  final String text;
  final bool isSelected;

  const DisplayModeItem({
    super.key,
    required this.onTap,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWellTransparent(
      onTap: onTap,
      child: OnHoverText(
        text: text,
        isConstantlyHovered: isSelected,
      ),
    );
  }
}
