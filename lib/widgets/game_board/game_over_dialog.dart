import 'package:flutter/material.dart';
import 'package:retro_snake/theme/color_extension.dart';


import '../../assets/assets.dart';
import '../common/box_decoration.dart';
import '../common/ink_well_transparent.dart';
import '../common/on_hover_text.dart';

class GameOverDialog extends StatelessWidget {
  final Function() onTryAgain;
  final bool isRecord;

  const GameOverDialog(
      {Key? key, required this.onTryAgain, required this.isRecord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: gameDialogWidth,
      height: gameDialogHeight,
      padding: const EdgeInsets.all(30),
      decoration: boardDialogDecoration(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AssetsStrings.gameOver,
            style: AssetsFonts.h2(context.colors.primary),
          ),
          const SizedBox(height: 10),
          if (isRecord)
            Text(
              AssetsStrings.newRecord,
              style: AssetsFonts.h2(context.colors.primary),
            ),
          const SizedBox(height: 20),
          InkWellTransparent(
            onTap: onTryAgain,
            child: OnHoverText(
              text: AssetsStrings.tryAgain,
              style: AssetsFonts.p1(context.colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
