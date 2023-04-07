import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/provider/snake/snake_notifier.dart';
import 'package:retro_snake/provider/snake/snake_provider.dart';
import 'package:retro_snake/utils/get_random_cell_position.dart';
import 'package:retro_snake/widgets/food_widget.dart';

import 'assets/AssetsColors.dart';
import 'game_constants.dart';
import 'model/cell_position.dart';
import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';
import 'model/food.dart';
import 'model/snake.dart';
import 'widgets/snake_body_part_widget.dart';

class GameBoard extends ConsumerStatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  List<Widget> draw(
    Snake snake,
    Food food,
    double boardCellSize,
  ) {
    List<Widget> snakeWidgets = snake.bodyParts
        .map((e) => SnakeBodyPartWidget(
            color: e.bodyPartType == SnakeBodyPartType.head
                ? AssetsColors.yellow
                : AssetsColors.green,
            xPosition: e.cellPosition.x * boardCellSize,
            yPosition: e.cellPosition.y * boardCellSize,
            size: boardCellSize))
        .toList();
    Widget foodWidget = FoodWidget(
        xPosition: food.cellPosition.x * boardCellSize,
        yPosition: food.cellPosition.y * boardCellSize,
        size: boardCellSize);
    return [foodWidget, ...snakeWidgets];
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return GameBoardState();
  }
}

class GameBoardState extends ConsumerState<GameBoard> {
  bool hasSnakeEatenFood = false;
  Food food = const Food(cellPosition: CellPosition(x: 25, y: 25));
  bool isGameOver = false;

  @override
  void initState() {
    super.initState();
    Stream.periodic(const Duration(milliseconds: 200)).listen((event) {
      if (!isGameOver) {
        ref.read(snakeProvider.notifier).moveSnake();
        hitDetection(ref.read(snakeProvider));
        hasSnakeEatenFood = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void hitDetection(Snake snake) {
    if (_checkSnakeHit(snake) ||
        _checkWallHit(snake.bodyParts.first.cellPosition)) {
      isGameOver = true;
    }
  }

  bool _checkSnakeHit(Snake snake) {
    return snake.bodyParts.getRange(1, snake.bodyParts.length).any((element) =>
        element.cellPosition == snake.bodyParts.first.cellPosition);
  }

  bool _checkWallHit(CellPosition snakeHeadPosition) {
    return snakeHeadPosition.x < 0 ||
        snakeHeadPosition.x >= GameConstants.boardCellsNumber ||
        snakeHeadPosition.y < 0 ||
        snakeHeadPosition.y >= GameConstants.boardCellsNumber;
  }

  Food _getNewFood(Snake snake) {
    while (true) {
      Food newFood = Food(cellPosition: getRandomCellPosition());
      if (snake.bodyParts
          .every((element) => element.cellPosition != newFood.cellPosition)) {
        return newFood;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double boardSize = MediaQuery.of(context).size.height * 0.8;
    double boardCellSize = boardSize / GameConstants.boardCellsNumber;

    SnakeNotifier snakeNotifier = ref.read(snakeProvider.notifier);
    Snake snake = ref.watch(snakeProvider);

    if (snake.bodyParts.first.cellPosition == food.cellPosition) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!hasSnakeEatenFood) {
          snakeNotifier.eat(snake.direction);
          setState(() {
            food = _getNewFood(snake);
          });
          hasSnakeEatenFood = true;
        }
      });
    }

    return RawKeyboardListener(
      autofocus: true,
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
            snakeNotifier.changeDirection(Direction.up);
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            snakeNotifier.changeDirection(Direction.down);
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            snakeNotifier.changeDirection(Direction.left);
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            snakeNotifier.changeDirection(Direction.right);
          }
        }
      },
      focusNode: FocusNode(),
      child: Container(
        width: boardSize,
        height: boardSize,
        decoration: const BoxDecoration(color: Color(0xff9370DB)),
        child: Stack(
          children: [
            ...widget.draw(snake, food, boardCellSize),
            if (isGameOver)
              Center(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Game Over',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
