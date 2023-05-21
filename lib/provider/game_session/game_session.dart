import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../model/enums/game_status.dart';

@immutable
class GameSession extends Equatable {
  final GameStatus gameStatus;
  final int score;
  final bool isRecord;

  const GameSession({
    required this.gameStatus,
    required this.score,
    required this.isRecord,
  });

  static const initial = GameSession(
    gameStatus: GameStatus.none,
    score: 0,
    isRecord: false,
  );

  GameSession copyWith({
    GameStatus? gameStatus,
    int? score,
    bool? isRecord,
  }) {
    return GameSession(
      gameStatus: gameStatus ?? this.gameStatus,
      score: score ?? this.score,
      isRecord: isRecord ?? this.isRecord,
    );
  }

  @override
  List<Object?> get props => [
        gameStatus,
        score,
        isRecord,
      ];
}
