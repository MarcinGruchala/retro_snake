import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retro_snake/game_constants.dart';
import 'package:retro_snake/provider/game_session/game_session.dart';
import 'package:retro_snake/provider/snake/snake.dart';

import '../food.dart';
import '../portal/portal.dart';

part 'game_board_state.freezed.dart';

@freezed
class GameBoardState with _$GameBoardState {
  const factory GameBoardState({
    required Snake snake,
    required Food food,
    required List<Portal> portals,
    required GameSession gameSession,
  }) = _GameBoardState;

  static const initial = GameBoardState(
    snake: GameConstants.defaultSnake,
    food: GameConstants.defaultFood,
    gameSession: GameSession.initial,
    portals: GameConstants.defaultPortals,
  );
}
