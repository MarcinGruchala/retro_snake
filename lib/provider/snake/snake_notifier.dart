import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/model/snake.dart';

import '../../game_constants.dart';
import '../../model/enums/direction.dart';
import '../../model/enums/snake_body_part_type.dart';
import '../../model/snake_body_part.dart';

class SnakeNotifier extends StateNotifier<Snake> {
  SnakeNotifier() : super(GameConstants.defaultSnake);

  void moveSnake() {
    SnakeBodyPart newHead = _moveHead(state.direction, state.bodyParts.first);
    List<SnakeBodyPart> newBodyParts = _moveBodyParts(state);

    state = Snake(
        direction: state.direction, bodyParts: [newHead, ...newBodyParts]);
  }

  void changeDirection(Direction newDirection) {
    state = Snake(direction: newDirection, bodyParts: [...state.bodyParts]);
  }

  SnakeBodyPart _moveHead(Direction direction, SnakeBodyPart head) {
    switch (direction) {
      case Direction.up:
        return SnakeBodyPart(
            xCellPosition: head.xCellPosition,
            yCellPosition: head.yCellPosition - 1,
            bodyPartType: SnakeBodyPartType.head);
      case Direction.down:
        return SnakeBodyPart(
            xCellPosition: head.xCellPosition,
            yCellPosition: head.yCellPosition + 1,
            bodyPartType: SnakeBodyPartType.head);
      case Direction.left:
        return SnakeBodyPart(
            xCellPosition: head.xCellPosition - 1,
            yCellPosition: head.yCellPosition,
            bodyPartType: SnakeBodyPartType.head);
      case Direction.right:
        return SnakeBodyPart(
            xCellPosition: head.xCellPosition + 1,
            yCellPosition: head.yCellPosition,
            bodyPartType: SnakeBodyPartType.head);
    }
  }

  List<SnakeBodyPart> _moveBodyParts(Snake snake) {
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
}
