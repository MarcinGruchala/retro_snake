import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/model/portal/portal.dart';
import 'package:retro_snake/provider/snake/snake.dart';

import '../../game_constants.dart';
import '../../model/enums/direction.dart';
import '../../model/enums/snake_body_part_type.dart';
import '../../model/snake_body_part.dart';
import '../../utils/move_cell.dart';

class SnakeNotifier extends StateNotifier<Snake> {
  SnakeNotifier() : super(GameConstants.defaultSnake);

  void moveSnake(List<Portal> portals) {
    SnakeBodyPart newHead = _moveHead(
      state.direction,
      state.bodyParts.first,
      portals,
    );
    List<SnakeBodyPart> newBodyParts = _moveBodyParts(state);
    if (state.eat) {
      _digest(newHead);
    } else {
      state = state.copyWith(bodyParts: [newHead, ...newBodyParts]);
    }
  }

  void changeDirection(Direction newDirection) {
    state = state.copyWith(direction: newDirection);
  }

  void eat() {
    state = state.copyWith(eat: true);
  }

  void setToDefault() {
    state = GameConstants.defaultSnake;
  }

  void _digest(SnakeBodyPart newHead) {
    state = state.copyWith(
      bodyParts: [
        newHead,
        SnakeBodyPart(
            cellPosition: state.bodyParts.first.cellPosition,
            bodyPartType: SnakeBodyPartType.body),
        ...state.bodyParts.getRange(1, state.bodyParts.length)
      ],
      eat: false,
    );
  }

  SnakeBodyPart _moveHead(
    Direction direction,
    SnakeBodyPart head,
    List<Portal> portals,
  ) {
    final PortalInList? portalInList =
        _checkIfBodyPartIsInPortals(head, GameConstants.defaultPortals);

    if (portalInList != null) {
      return SnakeBodyPart(
          cellPosition: moveCellThroughPortal(
            cellPosition: head.cellPosition,
            direction: direction,
            portalEntry: portalInList.portalEntry,
            portal: portals[portalInList.listIndex],
          ),
          bodyPartType: SnakeBodyPartType.head);
    }

    return SnakeBodyPart(
        cellPosition: moveCell(head.cellPosition, direction),
        bodyPartType: SnakeBodyPartType.head);
  }

  List<SnakeBodyPart> _moveBodyParts(Snake snake) {
    List<SnakeBodyPart> newBodyParts = [];
    snake.bodyParts.asMap().forEach((key, value) {
      if (key != snake.bodyParts.length - 1) {
        newBodyParts.add(SnakeBodyPart(
            cellPosition: snake.bodyParts[key].cellPosition,
            bodyPartType: SnakeBodyPartType.body));
      }
    });
    return newBodyParts;
  }

  PortalInList? _checkIfBodyPartIsInPortals(
    SnakeBodyPart bodyPart,
    List<Portal> portals,
  ) {
    for (int i = 0; i < portals.length; i++) {
      if (bodyPart.cellPosition == portals[i].positionOne) {
        return PortalInList(PortalEntry.first, i);
      }
      if (bodyPart.cellPosition == portals[i].positionTwo) {
        return PortalInList(PortalEntry.second, i);
      }
    }

    return null;
  }
}

class PortalInList {
  final PortalEntry portalEntry;
  final int listIndex;

  PortalInList(this.portalEntry, this.listIndex);
}
