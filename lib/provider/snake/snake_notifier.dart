import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/provider/snake/snake.dart';

import '../../game_constants.dart';
import '../../model/enums/direction.dart';
import '../../model/enums/snake_body_part_type.dart';
import '../../model/snake_body_part.dart';
import '../../utils/move_cell.dart';

class SnakeNotifier extends StateNotifier<Snake> {
  SnakeNotifier() : super(GameConstants.defaultSnake);

  void moveSnake() {
    SnakeBodyPart newHead = _moveHead(state.direction, state.bodyParts.first);
    List<SnakeBodyPart> newBodyParts = _moveBodyParts(state);
    if (state.eat) {
      _digest(newHead);
    } else {
      state = state.copyWith(bodyParts: [newHead, ...newBodyParts]);
    }
  }

  void changeDirection(Direction newDirection) {
    state = state.copyWith(direction: newDirection);
  }

  void eat(Direction direction) {
    state = state.copyWith(eat: true);
  }

  void setToDefault() {
    state = GameConstants.defaultSnake;
  }

  void _digest(SnakeBodyPart newHead) {
    state = state.copyWith(
      bodyParts: [
        newHead,
        SnakeBodyPart(
            cellPosition: state.bodyParts.first.cellPosition,
            bodyPartType: SnakeBodyPartType.body),
        ...state.bodyParts.getRange(1, state.bodyParts.length)
      ],
      eat: false,
    );
  }

  SnakeBodyPart _moveHead(Direction direction, SnakeBodyPart head) {
    return SnakeBodyPart(
        cellPosition: moveCell(head.cellPosition, direction),
        bodyPartType: SnakeBodyPartType.head);
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
