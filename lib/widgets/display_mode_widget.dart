import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../assets/assets.dart';
import '../model/enums/display_mode.dart';
import '../provider/display_mode.dart';
import 'common/text/retro_text_h2.dart';
import 'common/text/retro_text_p1.dart';

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
          const RetroTextH2(AssetsStrings.displayMode),
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

class DisplayModeItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          RetroTextP1(text),
          const SizedBox(width: 8),
          Visibility(
            visible: isSelected,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Icon(Icons.star, color: context.colors.primary),
          )
        ],
      ),
    );
  }
}
