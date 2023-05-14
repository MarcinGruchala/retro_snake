import '../game_constants.dart';
import '../model/cell_position.dart';
import 'get_random_number.dart';

CellPosition getRandomCellPosition() {
  return CellPosition(
      x: getRandomInt(1, GameConstants.boardCellsNumber),
      y: getRandomInt(1, GameConstants.boardCellsNumber));
}
