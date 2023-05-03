import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/enums/direction.dart';
import '../../model/snake_body_part.dart';

@immutable
class Snake extends Equatable {
  final Direction direction;
  final List<SnakeBodyPart> bodyParts;
  final bool eat;

  const Snake({
    required this.direction,
    required this.bodyParts,
    required this.eat,
  });

  Snake copyWith({
    Direction? direction,
    List<SnakeBodyPart>? bodyParts,
    bool? eat,
  }) {
    return Snake(
      direction: direction ?? this.direction,
      bodyParts: bodyParts ?? this.bodyParts,
      eat: eat ?? this.eat,
    );
  }

  Direction calculateTailDirection() {
    final tailBodyPartPosition = bodyParts.last.cellPosition;
    final penultimateBodyPartPosition =
        bodyParts[bodyParts.length - 2].cellPosition;
    if (tailBodyPartPosition.x == penultimateBodyPartPosition.x &&
        tailBodyPartPosition.y == penultimateBodyPartPosition.y - 1) {
      return Direction.up;
    }
    if (tailBodyPartPosition.x == penultimateBodyPartPosition.x &&
        tailBodyPartPosition.y == penultimateBodyPartPosition.y + 1) {
      return Direction.down;
    }
    if (tailBodyPartPosition.x == penultimateBodyPartPosition.x - 1 &&
        tailBodyPartPosition.y == penultimateBodyPartPosition.y) {
      return Direction.left;
    }
    if (tailBodyPartPosition.x == penultimateBodyPartPosition.x + 1 &&
        tailBodyPartPosition.y == penultimateBodyPartPosition.y) {
      return Direction.right;
    }
    return Direction.up;
  }

  @override
  List<Object?> get props => [direction, bodyParts];
}
