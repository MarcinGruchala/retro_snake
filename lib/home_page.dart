import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'assets/assets_colors.dart';
import 'widgets/game_board/game_board_widget.dart';
import 'widgets/game_stats_widget.dart';
import 'widgets/origin_info.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      backgroundColor: AssetsColors.darkGreen,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: GameStatsWidget(),
                    )),
                SizedBox(width: 8),
                Expanded(flex: 2, child: GameBoardWidget()),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: OriginInfo(),
            )
          ],
        ),
      ),
    );
  }
}
