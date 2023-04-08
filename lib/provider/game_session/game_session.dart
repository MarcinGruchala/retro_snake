import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../model/enums/game_status.dart';

@immutable
class GameSession extends Equatable {
  final GameStatus gameStatus;
  final bool hasSnakeEatenFood;

  const GameSession(
      {required this.gameStatus, required this.hasSnakeEatenFood});

  static const initial = GameSession(
    gameStatus: GameStatus.running,
    hasSnakeEatenFood: false,
  );

  GameSession copyWith({
    GameStatus? gameStatus,
    bool? hasSnakeEatenFood,
  }) {
    return GameSession(
      gameStatus: gameStatus ?? this.gameStatus,
      hasSnakeEatenFood: hasSnakeEatenFood ?? this.hasSnakeEatenFood,
    );
  }

  @override
  List<Object?> get props => [gameStatus, hasSnakeEatenFood];
}
