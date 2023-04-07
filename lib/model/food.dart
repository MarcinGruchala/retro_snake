import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:retro_snake/model/cell_position.dart';

@immutable
class Food extends Equatable {
  final CellPosition cellPosition;

  const Food({
    required this.cellPosition,
  });

  @override
  List<Object?> get props => [cellPosition];
}
