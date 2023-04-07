import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'enums/direction.dart';
import 'snake_body_part.dart';

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

  @override
  List<Object?> get props => [direction, bodyParts];
}
