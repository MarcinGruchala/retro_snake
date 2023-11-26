import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../game_constants.dart';
import '../../model/food.dart';
import '../../model/game_board_state/game_board_state.dart';
import '../../utils/get_random_cell_position.dart';

class FoodNotifier extends StateNotifier<Food> {
  FoodNotifier() : super(GameConstants.defaultFood);

  void generateNewFood(GameBoardState gameBoardState) {
    while (true) {
      Food newFood = Food(
        cellPosition: getRandomCellPosition(),
        score: GameConstants.foodDefaultScore,
      );
      if (_isNotCollidingWithSnake(gameBoardState, newFood) &&
          _isNotCollidingWithPortals(gameBoardState, newFood)) {
        state = newFood;
        break;
      }
    }
  }

  bool _isNotCollidingWithSnake(GameBoardState gameBoardState, Food newFood) {
    return gameBoardState.snake.bodyParts
        .every((element) => element.cellPosition != newFood.cellPosition);
  }

  bool _isNotCollidingWithPortals(GameBoardState gameBoardState, Food newFood) {
    return gameBoardState.portals.every(
      (element) =>
          element.positionOne != newFood.cellPosition &&
          element.positionTwo != newFood.cellPosition,
    );
  }

  void lowerScoreIfPossible() {
    if (state.score > 1) {
      state = state.copyWith(score: state.score - 1);
    }
  }

  void setToDefault() {
    state = GameConstants.defaultFood;
  }
}
