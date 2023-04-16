import 'package:flutter/material.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/widgets/common/text/retro_text_p1.dart';

import '../common/box_decoration.dart';
import '../common/text/retro_text_h2.dart';

class GameOverDialog extends StatelessWidget {
  final Function() onTryAgain;

  const GameOverDialog({Key? key, required this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: boardDialogDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RetroTextH2(
            AssetsStrings.gameOver,
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: onTryAgain,
            child: const RetroTextP1(
              AssetsStrings.tryAgain,
            ),
          ),
        ],
      ),
    );
  }
}
