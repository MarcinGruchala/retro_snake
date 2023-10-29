import 'package:flutter/material.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/theme/color_extension.dart';
import 'package:retro_snake/widgets/common/text/retro_text_p1.dart';

import '../common/box_decoration.dart';
import '../common/text/retro_text_h2.dart';

class GameLauncherDialog extends StatelessWidget {
  final Function() onStartGamePressed;

  const GameLauncherDialog({
    super.key,
    required this.onStartGamePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boardDialogDecoration(context),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RetroTextP1(AssetsStrings.moveInstruction),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(AssetsIcons.arrowLeft, color: context.colors.primary),
              Icon(AssetsIcons.arrowRight, color: context.colors.primary),
              Icon(AssetsIcons.arrowUp, color: context.colors.primary),
              Icon(AssetsIcons.arrowDown, color: context.colors.primary),
            ],
          ),
          TextButton(
            onPressed: onStartGamePressed,
            child: const RetroTextH2(
              AssetsStrings.startGame,
            ),
          ),
        ],
      ),
    );
  }
}
