import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/provider/version_provider.dart';
import 'package:retro_snake/widgets/common/text/retro_text_p1.dart';
import 'package:retro_snake/widgets/game_stats_widget.dart';

import 'widgets/game_board/game_board_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String version = ref.watch(versionProvider);

    return Scaffold(
      backgroundColor: AssetsColors.darkGreen,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(flex: 1, child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: GameStatsWidget(),
                )),
                SizedBox(width: 8),
                Expanded(flex: 2, child: GameBoardWidget()),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RetroTextP1(AssetsStrings.version(version)),
            )
          ],
        ),
      ),
    );
  }
}
