import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';

import 'widgets/display_mode_widget.dart';
import 'widgets/game_board/game_board_widget.dart';
import 'widgets/game_stats_widget.dart';
import 'widgets/game_title_widget.dart';
import 'widgets/origin_info.dart';
import 'widgets/settings_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static const double gameInfoWidthBreakpoint = 1000;
  static const double gameInfoHeightBreakpoint = 600;
  static const double originInfoHeightBreakpoint = 550;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (screenWidth > gameInfoWidthBreakpoint &&
                    screenHeight > gameInfoHeightBreakpoint) ...[
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: GameInfoCollumn(),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                const SizedBox(width: 8),
                const Expanded(flex: 2, child: GameBoardWidget()),
                // Expanded(flex: 1, child: SizedBox())
              ],
            ),
            if (screenHeight > originInfoHeightBreakpoint)
              const Row(
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

class GameInfoCollumn extends StatelessWidget {
  const GameInfoCollumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
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
    );
  }
}
