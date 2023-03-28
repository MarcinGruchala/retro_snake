import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/model/snake.dart';

import '../../game_constants.dart';
import '../../model/cell_position.dart';
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

  void eat(Direction direction) {
    state = Snake(direction: state.direction, bodyParts: [
      ...state.bodyParts,
      _appendBodyPart(state.direction, state.bodyParts.last)
    ]);
  }

  SnakeBodyPart _appendBodyPart(
    Direction direction,
    SnakeBodyPart lastBodyPart,
  ) {
    switch (direction) {
      case Direction.up:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: lastBodyPart.cellPosition.x,
                y: lastBodyPart.cellPosition.y + 1),
            bodyPartType: SnakeBodyPartType.body);
      case Direction.down:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: lastBodyPart.cellPosition.x,
                y: lastBodyPart.cellPosition.y - 1),
            bodyPartType: SnakeBodyPartType.body);
      case Direction.left:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: lastBodyPart.cellPosition.x + 1,
                y: lastBodyPart.cellPosition.y),
            bodyPartType: SnakeBodyPartType.body);
      case Direction.right:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: lastBodyPart.cellPosition.x - 1,
                y: lastBodyPart.cellPosition.y),
            bodyPartType: SnakeBodyPartType.body);
    }
  }

  SnakeBodyPart _moveHead(Direction direction, SnakeBodyPart head) {
    switch (direction) {
      case Direction.up:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: head.cellPosition.x, y: head.cellPosition.y - 1),
            bodyPartType: SnakeBodyPartType.head);
      case Direction.down:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: head.cellPosition.x, y: head.cellPosition.y + 1),
            bodyPartType: SnakeBodyPartType.head);
      case Direction.left:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: head.cellPosition.x - 1, y: head.cellPosition.y),
            bodyPartType: SnakeBodyPartType.head);
      case Direction.right:
        return SnakeBodyPart(
            cellPosition: CellPosition(
                x: head.cellPosition.x + 1, y: head.cellPosition.y),
            bodyPartType: SnakeBodyPartType.head);
    }
  }

  List<SnakeBodyPart> _moveBodyParts(Snake snake) {
    List<SnakeBodyPart> newBodyParts = [];
    snake.bodyParts.asMap().forEach((key, value) {
      if (key != snake.bodyParts.length - 1) {
        newBodyParts.add(SnakeBodyPart(
            cellPosition: snake.bodyParts[key].cellPosition,
            bodyPartType: SnakeBodyPartType.body));
      }
    });
    return newBodyParts;
  }
}
