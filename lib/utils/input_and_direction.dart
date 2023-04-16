import 'package:flutter/services.dart';

import '../model/enums/direction.dart';
import '../provider/snake/snake.dart';

final listOfDirectionKeys = [
  LogicalKeyboardKey.arrowUp,
  LogicalKeyboardKey.arrowDown,
  LogicalKeyboardKey.arrowLeft,
  LogicalKeyboardKey.arrowRight,
];

final mapOfDirectionKeys = {
  LogicalKeyboardKey.arrowUp: Direction.up,
  LogicalKeyboardKey.arrowDown: Direction.down,
  LogicalKeyboardKey.arrowLeft: Direction.left,
  LogicalKeyboardKey.arrowRight: Direction.right,
};

Direction takeFirstValidDirection(Snake snake, List<Direction> moves) {
  Direction? firstValidDirection;
  for (int i = 0; i < moves.length; i++) {
    if (moves[i] != opposingDirection[snake.direction] &&
        moves[i] != snake.direction) {
      firstValidDirection = moves[i];
      moves.removeRange(0, i + 1);
      break;
    }
  }
  return firstValidDirection ?? snake.direction;
}
