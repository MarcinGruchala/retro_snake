import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../assets/assets.dart';
import '../provider/game_stats/games_stats_provider.dart';

class GameStatsWidget extends ConsumerWidget {
  const GameStatsWidget({super.key});

  Widget watchGamesPlayed(BuildContext context, WidgetRef ref) {
    return ref.watch(gamesPlayedProvider).when(
      data: (data) {
        return Text(
          AssetsStrings.gamesPlayed(data.toString()),
          style: AssetsFonts.p1(context.colors.primary),
        );
      },
      error: (error, stackTrace) {
        return Text(
          AssetsStrings.gamesPlayed('...'),
          style: AssetsFonts.p1(context.colors.primary),
        );
      },
      loading: () {
        return Text(
          AssetsStrings.gamesPlayed('...'),
          style: AssetsFonts.p1(context.colors.primary),
        );
      },
    );
  }

  Widget watchRecordOverall(BuildContext context, WidgetRef ref) {
    return ref.watch(recordOverallProvider).when(
      data: (data) {
        return Text(
          AssetsStrings.recordOverall(data.toString()),
          style: AssetsFonts.p1(context.colors.primary),
        );
      },
      error: (error, stackTrace) {
        return Text(
          AssetsStrings.recordOverall('...'),
          style: AssetsFonts.p1(context.colors.primary),
        );
      },
      loading: () {
        return Text(
          AssetsStrings.recordOverall('...'),
          style: AssetsFonts.p1(context.colors.primary),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      decoration: blackFrame(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AssetsStrings.gameStats,
              style: AssetsFonts.h2(context.colors.primary),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                watchGamesPlayed(context, ref),
                const SizedBox(height: 8),
                watchRecordOverall(context, ref),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
