import '../model/cell_position.dart';
import '../model/enums/direction.dart';

CellPosition moveCell(CellPosition cellPosition, Direction direction) {
  switch (direction) {
    case Direction.up:
      return CellPosition(x: cellPosition.x, y: cellPosition.y - 1);
    case Direction.down:
      return CellPosition(x: cellPosition.x, y: cellPosition.y + 1);
    case Direction.left:
      return CellPosition(x: cellPosition.x - 1, y: cellPosition.y);
    case Direction.right:
      return CellPosition(x: cellPosition.x + 1, y: cellPosition.y);
  }
}
