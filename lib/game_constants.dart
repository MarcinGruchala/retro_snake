import 'package:retro_snake/model/food.dart';

import 'model/cell_position.dart';
import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';
import 'provider/snake/snake.dart';
import 'model/snake_body_part.dart';

class GameConstants {
  static const boardCellsNumber = 20;
  static const Snake defaultSnake = Snake(
    direction: Direction.down,
    bodyParts: [
      SnakeBodyPart(
          cellPosition: CellPosition(x: 5, y: 5),
          bodyPartType: SnakeBodyPartType.head),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 6, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 7, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 8, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 9, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 10, y: 5),
          bodyPartType: SnakeBodyPartType.body),
    ],
    eat: false,
  );
  static const defaultFood = Food(cellPosition: CellPosition(x: 15, y: 15));
  static const gameFrameDuration = Duration(milliseconds: 200);
}
