enum Direction { up, down, left, right }

final opposingDirection = {
  Direction.up: Direction.down,
  Direction.down: Direction.up,
  Direction.left: Direction.right,
  Direction.right: Direction.left,
};
