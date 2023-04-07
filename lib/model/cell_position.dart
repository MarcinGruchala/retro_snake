import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class CellPosition extends Equatable {
  final int x;
  final int y;

  const CellPosition({
    required this.x,
    required this.y,
  });

  @override
  List<Object?> get props => [x, y];
}
