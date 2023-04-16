import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:retro_snake/game_constants.dart';
import 'package:retro_snake/provider/game_session/game_session.dart';
import 'package:retro_snake/provider/snake/snake.dart';

import '../../model/food.dart';

@immutable
class GameBoardState extends Equatable {
  final Snake snake;
  final Food food;
  final GameSession gameSession;

  const GameBoardState({
    required this.snake,
    required this.food,
    required this.gameSession,
  });

  static const initial = GameBoardState(
    snake: GameConstants.defaultSnake,
    food: GameConstants.defaultFood,
    gameSession: GameSession.initial,
  );

  @override
  List<Object?> get props => [
        snake,
        food,
        gameSession,
      ];
}
