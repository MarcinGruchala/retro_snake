import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/widgets/common/text/retro_text_h2.dart';
import 'package:retro_snake/widgets/common/text/retro_text_p1.dart';

import '../assets/assets.dart';

class GameStatsWidget extends ConsumerWidget {
  const GameStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      decoration: AssetsDecoration.blackFrame,
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RetroTextH2(AssetsStrings.gameStats),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RetroTextP1(AssetsStrings.gamesPlayed(50)),
                const SizedBox(height: 8),
                RetroTextP1(AssetsStrings.recordOverall(100)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
