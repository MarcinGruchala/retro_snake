import 'direction.dart';

class Snake {
  final Direction direction;
  final List<SnakeBodyPart> bodyParts;

  Snake({
    required this.direction,
    required this.bodyParts,
  });
}

class SnakeBodyPart {
  final int xCellPosition;
  final int yCellPosition;
  final SnakeBodyPartType bodyPartType;

  SnakeBodyPart({
    required this.xCellPosition,
    required this.yCellPosition,
    required this.bodyPartType,
  });
}

enum SnakeBodyPartType { head, body }
