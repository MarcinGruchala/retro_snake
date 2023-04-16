import 'package:flutter/material.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/assets/assets_icons.dart';
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
      decoration: boardDialogDecoration,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RetroTextP1(AssetsStrings.moveInstruction),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(AssetsIcons.arrowLeft, color: AssetsColors.black),
              Icon(AssetsIcons.arrowRight, color: AssetsColors.black),
              Icon(AssetsIcons.arrowUp, color: AssetsColors.black),
              Icon(AssetsIcons.arrowDown, color: AssetsColors.black),
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
