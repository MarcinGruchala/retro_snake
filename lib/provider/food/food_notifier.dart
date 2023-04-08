import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/game_constants.dart';
import 'package:retro_snake/provider/snake/snake.dart';

import '../../model/food.dart';
import '../../utils/get_random_cell_position.dart';

class FoodNotifier extends StateNotifier<Food> {
  FoodNotifier() : super(GameConstants.defaultFood);

  void generateNewFood(Snake snake) {
    while (true) {
      Food newFood = Food(cellPosition: getRandomCellPosition());
      if (snake.bodyParts
          .every((element) => element.cellPosition != newFood.cellPosition)) {
        state = newFood;
        break;
      }
    }
  }
}
