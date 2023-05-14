import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../model/enums/game_status.dart';

@immutable
class GameSession extends Equatable {
  final GameStatus gameStatus;
  final int score;

  const GameSession({
    required this.gameStatus,
    required this.score,
  });

  static const initial = GameSession(
    gameStatus: GameStatus.none,
    score: 0,
  );

  GameSession copyWith({
    GameStatus? gameStatus,
    bool? hasSnakeEatenFood,
    int? score,
  }) {
    return GameSession(
      gameStatus: gameStatus ?? this.gameStatus,
      score: score ?? this.score,
    );
  }

  @override
  List<Object?> get props => [gameStatus, score];
}
