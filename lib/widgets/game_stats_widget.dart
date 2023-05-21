import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/widgets/common/text/retro_text_h2.dart';
import 'package:retro_snake/widgets/common/text/retro_text_p1.dart';

import '../assets/assets.dart';
import '../provider/game_stats/games_stats_provider.dart';

class GameStatsWidget extends ConsumerWidget {
  const GameStatsWidget({super.key});

  Widget watchGamesPlayed(WidgetRef ref) {
    return ref.watch(gamesPlayedProvider).when(
      data: (data) {
        return RetroTextP1(AssetsStrings.gamesPlayed(data.toString()));
      },
      error: (error, stackTrace) {
        return RetroTextP1(AssetsStrings.gamesPlayed('...'));
      },
      loading: () {
        return RetroTextP1(AssetsStrings.gamesPlayed('...'));
      },
    );
  }

  Widget watchRecordOverall(WidgetRef ref) {
    return ref.watch(recordOverallProvider).when(
      data: (data) {
        return RetroTextP1(AssetsStrings.recordOverall(data.toString()));
      },
      error: (error, stackTrace) {
        return RetroTextP1(AssetsStrings.recordOverall('...'));
      },
      loading: () {
        return RetroTextP1(AssetsStrings.recordOverall('...'));
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      decoration: AssetsDecoration.blackFrame,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RetroTextH2(AssetsStrings.gameStats),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                watchGamesPlayed(ref),
                const SizedBox(height: 8),
                watchRecordOverall(ref),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
