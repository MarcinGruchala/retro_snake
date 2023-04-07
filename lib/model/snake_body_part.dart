import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:retro_snake/model/cell_position.dart';

import 'enums/snake_body_part_type.dart';

@immutable
class SnakeBodyPart extends Equatable {
  final CellPosition cellPosition;
  final SnakeBodyPartType bodyPartType;

  const SnakeBodyPart({
    required this.cellPosition,
    required this.bodyPartType,
  });

  @override
  List<Object?> get props => [cellPosition, bodyPartType];
}
