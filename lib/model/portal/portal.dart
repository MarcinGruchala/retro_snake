import 'package:freezed_annotation/freezed_annotation.dart';

import '../../widgets/portal_widget.dart';
import '../cell_position.dart';

part 'portal.freezed.dart';

@freezed
class Portal with _$Portal {
  const factory Portal({
    required CellPosition positionOne,
    required CellPosition positionTwo,
  }) = _Portal;
}

extension PortalToPortalWidgets on Portal {
  List<PortalWidget> mapToPortalWidgets({
    required double boardCellSize,
    required bool isActive,
  }) {
    return [
      PortalWidget(
        xPosition: positionOne.x * boardCellSize,
        yPosition: positionOne.y * boardCellSize,
        size: boardCellSize,
        isActive: isActive,
      ),
      PortalWidget(
        xPosition: positionTwo.x * boardCellSize,
        yPosition: positionTwo.y * boardCellSize,
        size: boardCellSize,
        isActive: isActive,
      ),
    ];
  }
}
