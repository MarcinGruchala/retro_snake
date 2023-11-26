import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';
import 'package:retro_snake/widgets/display_mode_widget.dart';
import 'package:retro_snake/widgets/game_title_widget.dart';
import 'package:retro_snake/widgets/settings_widget.dart';

import 'widgets/game_board/game_board_widget.dart';
import 'widgets/game_stats_widget.dart';
import 'widgets/origin_info.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GameTitle(),
                        SizedBox(height: 20),
                        GameStatsWidget(),
                        SizedBox(height: 20),
                        DisplayModeWidget(),
                        SizedBox(height: 20),
                        SettingsWidget()
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(flex: 2, child: GameBoardWidget()),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OriginInfo(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
