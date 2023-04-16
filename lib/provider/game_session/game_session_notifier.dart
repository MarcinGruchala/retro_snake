import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/model/enums/game_status.dart';

import 'game_session.dart';

class GameSessionNotifier extends StateNotifier<GameSession> {
  GameSessionNotifier() : super(GameSession.initial);

  void startGame() {
    state = state.copyWith(gameStatus: GameStatus.running);
  }

  void finishGame() {
    state = state.copyWith(gameStatus: GameStatus.over);
  }

  void resetGame() {
    state = GameSession.initial;
  }

  void snakeHasEatenFood() {
    state = state.copyWith(hasSnakeEatenFood: true);
  }

  void snakeHasMoved() {
    state = state.copyWith(hasSnakeEatenFood: false);
  }
}
