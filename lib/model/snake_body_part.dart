import 'package:flutter/material.dart';

import 'enums/snake_body_part_type.dart';

@immutable
class SnakeBodyPart {
  final int xCellPosition;
  final int yCellPosition;
  final SnakeBodyPartType bodyPartType;

  const SnakeBodyPart({
    required this.xCellPosition,
    required this.yCellPosition,
    required this.bodyPartType,
  });
}
