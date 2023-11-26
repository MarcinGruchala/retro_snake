import 'package:flutter/material.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../common/box_decoration.dart';
import '../common/ink_well_transparent.dart';
import '../common/on_hover_text.dart';

class GameLauncherDialog extends StatelessWidget {
  final Function() onStartGamePressed;

  const GameLauncherDialog({
    super.key,
    required this.onStartGamePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: gameDialogWidth,
      height: gameDialogHeight,
      decoration: boardDialogDecoration(context),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AssetsStrings.moveInstruction,
            style: AssetsFonts.p1(context.colors.primary),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(AssetsIcons.arrowLeft, color: context.colors.primary),
              Icon(AssetsIcons.arrowRight, color: context.colors.primary),
              Icon(AssetsIcons.arrowUp, color: context.colors.primary),
              Icon(AssetsIcons.arrowDown, color: context.colors.primary),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWellTransparent(
                onTap: onStartGamePressed,
                child: OnHoverText(
                  text: AssetsStrings.startGame,
                  style: AssetsFonts.p1(context.colors.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
