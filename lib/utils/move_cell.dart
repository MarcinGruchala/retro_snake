import '../model/cell_position.dart';
import '../model/enums/direction.dart';
import '../model/portal/portal.dart';

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

enum PortalEntry { first, second }

CellPosition moveCellThroughPortal({
  required CellPosition cellPosition,
  required Direction direction,
  required PortalEntry portalEntry,
  required Portal portal,
}) {
  switch (portalEntry) {
    case PortalEntry.first:
      return _teleportCell(
        cellPosition: cellPosition,
        portalExit: portal.positionTwo,
        direction: direction,
      );
    case PortalEntry.second:
      return _teleportCell(
        cellPosition: cellPosition,
        portalExit: portal.positionOne,
        direction: direction,
      );
  }
}

CellPosition _teleportCell({
  required CellPosition cellPosition,
  required CellPosition portalExit,
  required Direction direction,
}) {
  switch (direction) {
    case Direction.up:
      return CellPosition(x: portalExit.x, y: portalExit.y - 1);
    case Direction.down:
      return CellPosition(x: portalExit.x, y: portalExit.y + 1);
    case Direction.left:
      return CellPosition(x: portalExit.x - 1, y: portalExit.y);
    case Direction.right:
      return CellPosition(x: portalExit.x + 1, y: portalExit.y);
  }
}
