import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/model/snake.dart';

import '../../game_constants.dart';
import '../../model/enums/direction.dart';
import '../../model/enums/snake_body_part_type.dart';
import '../../model/snake_body_part.dart';

class SnakeNotifier extends StateNotifier<Snake> {
  SnakeNotifier() : super(GameConstants.defaultSnake);

  void moveSnake() {
    state = _getNewSnakePosition(state);
  }

  void changeDirection(Direction newDirection) {
    state = Snake(direction: newDirection, bodyParts: [...state.bodyParts]);
  }

  Snake _getNewSnakePosition(Snake snake) {
    switch (snake.direction) {
      case Direction.up:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition,
            yCellPosition: snake.bodyParts.first.yCellPosition - 1,
            bodyPartType: SnakeBodyPartType.head);

        List<SnakeBodyPart> newBodyParts = _calculateNewBodyPosition(snake);
        return Snake(
            direction: snake.direction, bodyParts: [newHead, ...newBodyParts]);
      case Direction.down:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition,
            yCellPosition: snake.bodyParts.first.yCellPosition + 1,
            bodyPartType: SnakeBodyPartType.head);
        List<SnakeBodyPart> newBodyParts = _calculateNewBodyPosition(snake);
        return Snake(
            direction: snake.direction, bodyParts: [newHead, ...newBodyParts]);
      case Direction.left:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition - 1,
            yCellPosition: snake.bodyParts.first.yCellPosition,
            bodyPartType: SnakeBodyPartType.head);

        List<SnakeBodyPart> newBodyParts = _calculateNewBodyPosition(snake);
        return Snake(
            direction: snake.direction, bodyParts: [newHead, ...newBodyParts]);
      case Direction.right:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition + 1,
            yCellPosition: snake.bodyParts.first.yCellPosition,
            bodyPartType: SnakeBodyPartType.head);
        List<SnakeBodyPart> newBodyParts = _calculateNewBodyPosition(snake);
        return Snake(
            direction: snake.direction, bodyParts: [newHead, ...newBodyParts]);
    }
  }

  List<SnakeBodyPart> _calculateNewBodyPosition(Snake snake) {
    List<SnakeBodyPart> newBodyParts = [];
    snake.bodyParts.asMap().forEach((key, value) {
      if (key != snake.bodyParts.length - 1) {
        newBodyParts.add(SnakeBodyPart(
            xCellPosition: snake.bodyParts[key].xCellPosition,
            yCellPosition: snake.bodyParts[key].yCellPosition,
            bodyPartType: SnakeBodyPartType.body));
      }
    });
    return newBodyParts;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
