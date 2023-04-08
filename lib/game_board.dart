import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/model/enums/game_status.dart';
import 'package:retro_snake/provider/food/food_notifier.dart';
import 'package:retro_snake/provider/food/food_provider.dart';
import 'package:retro_snake/provider/game_session/game_session.dart';
import 'package:retro_snake/provider/game_session/game_session_provider.dart';
import 'package:retro_snake/provider/snake/snake_notifier.dart';
import 'package:retro_snake/provider/snake/snake_provider.dart';
import 'package:retro_snake/widgets/food_widget.dart';
import 'package:retro_snake/widgets/game_board/game_board_state.dart';

import 'assets/AssetsColors.dart';
import 'game_constants.dart';
import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';
import 'model/food.dart';
import 'provider/game_board_state_provider.dart';
import 'provider/snake/snake.dart';
import 'utils/hit_detection.dart';
import 'widgets/snake_body_part_widget.dart';

class GameBoardWidget extends ConsumerStatefulWidget {
  const GameBoardWidget({Key? key}) : super(key: key);

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
    return GameBoardWidgetState();
  }
}

class GameBoardWidgetState extends ConsumerState<GameBoardWidget> {
  @override
  void initState() {
    super.initState();
    Stream.periodic(GameConstants.gameFrameDuration).listen((event) {
      _performGameFrame(
          ref.watch(gameBoardStateProvider).gameSession.gameStatus);
    });
  }

  void _performGameFrame(GameStatus gameStatus) {
    if (gameStatus == GameStatus.running) {
      ref.read(snakeProvider.notifier).moveSnake();
      _hitDetection(ref.read(snakeProvider));
      ref.read(gameSessionProvider.notifier).snakeHasMoved();
    }
  }

  void _hitDetection(Snake snake) {
    if (checkSnakeHit(snake) ||
        checkWallHit(snake.bodyParts.first.cellPosition)) {
      ref.read(gameSessionProvider.notifier).finishGame();
    }
  }

  @override
  Widget build(BuildContext context) {
    double boardSize = MediaQuery.of(context).size.height * 0.8;
    double boardCellSize = boardSize / GameConstants.boardCellsNumber;

    SnakeNotifier snakeNotifier = ref.read(snakeProvider.notifier);
    FoodNotifier foodNotifier = ref.read(foodProvider.notifier);

    GameBoardState gameBoardState = ref.watch(gameBoardStateProvider);
    Snake snake = gameBoardState.snake;
    Food food = gameBoardState.food;
    GameSession gameSession = gameBoardState.gameSession;

    if (snake.bodyParts.first.cellPosition == food.cellPosition) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!gameSession.hasSnakeEatenFood) {
          snakeNotifier.eat(snake.direction);
          foodNotifier.generateNewFood(snake);
          ref.read(gameSessionProvider.notifier).snakeHasEatenFood();
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
            if (gameSession.gameStatus == GameStatus.over)
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
