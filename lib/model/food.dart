import 'package:flutter/foundation.dart';
import 'package:retro_snake/model/cell_position.dart';

@immutable
class Food {
  final CellPosition cellPosition;

  const Food({
    required this.cellPosition,
  });
}
