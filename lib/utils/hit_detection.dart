import '../game_constants.dart';
import '../model/cell_position.dart';
import '../provider/snake/snake.dart';

bool checkSnakeHit(Snake snake) {
  return snake.bodyParts.getRange(1, snake.bodyParts.length).any(
      (element) => element.cellPosition == snake.head.cellPosition);
}

bool checkWallHit(CellPosition snakeHeadPosition) {
  return snakeHeadPosition.x < 0 ||
      snakeHeadPosition.x >= GameConstants.boardCellsNumber ||
      snakeHeadPosition.y < 0 ||
      snakeHeadPosition.y >= GameConstants.boardCellsNumber;
}
