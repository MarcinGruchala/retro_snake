import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:retro_snake/model/cell_position.dart';

@immutable
class Food extends Equatable {
  final CellPosition cellPosition;
  final int score;

  const Food({
    required this.cellPosition,
    required this.score,
  });

  Food copyWith({
    CellPosition? cellPosition,
    int? score,
  }) {
    return Food(
      cellPosition: cellPosition ?? this.cellPosition,
      score: score ?? this.score,
    );
  }

  @override
  List<Object?> get props => [cellPosition, score];
}
