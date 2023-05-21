import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/model/enums/game_status.dart';
import 'package:retro_snake/utils/update_games_played.dart';
import 'package:retro_snake/utils/update_record_overall.dart';

import 'game_session.dart';

class GameSessionNotifier extends StateNotifier<GameSession> {
  GameSessionNotifier() : super(GameSession.initial);

  void startGame() {
    updateGamesPlayed();
    state = state.copyWith(gameStatus: GameStatus.running);
  }

  Future<void> finishGame() async {
    final isNewRecord = await updateRecordOverall(state.score);
    state = state.copyWith(gameStatus: GameStatus.over, isRecord: isNewRecord);
  }

  void resetGame() {
    state = GameSession.initial;
  }

  void addScore(int score) {
    state = state.copyWith(score: state.score + score);
  }
}
