import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';
import 'model/snake.dart';
import 'model/snake_body_part.dart';

class GameConstants {
  static const boardCellsNumber = 30;
  static const Snake defaultSnake = Snake(
    direction: Direction.right,
    bodyParts: [
      SnakeBodyPart(
          xCellPosition: 5,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.head),
      SnakeBodyPart(
          xCellPosition: 6,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 7,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 8,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 9,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 10,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
    ],
  );
}
