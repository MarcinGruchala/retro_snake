import 'package:flutter/material.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../assets/assets.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AssetsStrings.allNew,
          style: AssetsFonts.h2(context.colors.primary),
        ),
        Text(
          AssetsStrings.retroSnake,
          style: AssetsFonts.h1(context.colors.primary),
        ),
        Text(
          AssetsStrings.version,
          style: AssetsFonts.p1(context.colors.primary),
        ),
      ],
    );
  }
}
