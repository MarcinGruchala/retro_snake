import 'package:retro_snake/model/food.dart';

import 'model/cell_position.dart';
import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';
import 'model/portal/portal.dart';
import 'provider/snake/snake.dart';
import 'model/snake_body_part.dart';

class GameConstants {
  static const boardCellsNumber = 20;
  static const Snake defaultSnake = Snake(
    direction: Direction.right,
    bodyParts: [
      SnakeBodyPart(
          cellPosition: CellPosition(x: 9, y: 5),
          bodyPartType: SnakeBodyPartType.head),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 8, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 7, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 6, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 5, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 4, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 3, y: 5),
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          cellPosition: CellPosition(x: 2, y: 5),
          bodyPartType: SnakeBodyPartType.body),
    ],
    eat: false,
  );
  static const foodDefaultScore = 20;
  static const defaultFood =
      Food(cellPosition: CellPosition(x: 15, y: 15), score: foodDefaultScore);
  static const defaultPortals = [
    Portal(
      positionOne: CellPosition(x: 3, y: 3),
      positionTwo: CellPosition(x: 16, y: 16),
    ),
    Portal(
      positionOne: CellPosition(x: 16, y: 3),
      positionTwo: CellPosition(x: 3, y: 16),
    )
  ];
  static const gameFrameDuration = Duration(milliseconds: 150);
}
