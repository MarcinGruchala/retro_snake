import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'enums/direction.dart';
import 'snake_body_part.dart';

@immutable
class Snake extends Equatable {
  final Direction direction;
  final List<SnakeBodyPart> bodyParts;

  const Snake({
    required this.direction,
    required this.bodyParts,
  });

  @override
  List<Object?> get props => [direction, bodyParts];
}
