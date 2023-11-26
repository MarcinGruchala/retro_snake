import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/game_constants.dart';
import 'package:retro_snake/provider/settings.dart';
import 'package:retro_snake/provider/snake/snake_provider.dart';

import '../model/game_board_state/game_board_state.dart';
import 'food/food_provider.dart';
import 'game_session/game_session_provider.dart';

final gameBoardStateProvider = Provider.autoDispose(
  (ref) {
    return GameBoardState(
      snake: ref.watch(snakeProvider),
      food: ref.watch(foodProvider),
      gameSession: ref.watch(gameSessionProvider),
      portals: ref.watch(arePortalsEnabledProvider)
          ? GameConstants.defaultPortals
          : const [],
    );
  },
);
