import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/model/enums/game_status.dart';
import 'package:retro_snake/provider/food/food_notifier.dart';
import 'package:retro_snake/provider/food/food_provider.dart';
import 'package:retro_snake/provider/game_session/game_session.dart';
import 'package:retro_snake/provider/game_session/game_session_notifier.dart';
import 'package:retro_snake/provider/game_session/game_session_provider.dart';
import 'package:retro_snake/provider/snake/snake_notifier.dart';
import 'package:retro_snake/provider/snake/snake_provider.dart';
import 'package:retro_snake/widgets/food_widget.dart';
import 'package:retro_snake/widgets/game_board/game_board_state.dart';
import 'package:retro_snake/widgets/game_board/game_launcher_dialog.dart';
import 'package:retro_snake/widgets/game_board/game_over_dialog.dart';
import 'package:retro_snake/widgets/snake_head_widget.dart';

import 'game_constants.dart';
import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';
import 'model/food.dart';
import 'provider/game_board_state_provider.dart';
import 'provider/snake/snake.dart';
import 'utils/hit_detection.dart';
import 'utils/input_and_direction.dart';
import 'widgets/snake_body_part_widget.dart';

class GameBoardWidget extends ConsumerStatefulWidget {
  const GameBoardWidget({Key? key}) : super(key: key);

  List<Widget> draw(
    Snake snake,
    Food food,
    double boardCellSize,
  ) {
    List<Widget> snakeWidgets = snake.bodyParts.map((e) {
      if (e.bodyPartType == SnakeBodyPartType.head) {
        return SnakeHeadWidget(
            xPosition: e.cellPosition.x * boardCellSize,
            yPosition: e.cellPosition.y * boardCellSize,
            size: boardCellSize,
            color: AssetsColors.black,
            direction: snake.direction);
      }
      return SnakeBodyPartWidget(
        xPosition: e.cellPosition.x * boardCellSize,
        yPosition: e.cellPosition.y * boardCellSize,
        size: boardCellSize,
        color: AssetsColors.black,
      );
    }).toList();
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
  final List<Direction> _enteredDirections = [];

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
      _readNextMove();
      ref.read(snakeProvider.notifier).moveSnake();
      _hitDetection(ref.read(snakeProvider));
      ref.read(gameSessionProvider.notifier).snakeHasMoved();
    }
  }

  void _readNextMove() {
    if (_enteredDirections.isNotEmpty) {
      Direction nextDirection =
          takeFirstValidDirection(ref.read(snakeProvider), _enteredDirections);
      ref.read(snakeProvider.notifier).changeDirection(nextDirection);
    }
  }

  void _hitDetection(Snake snake) {
    if (checkSnakeHit(snake) ||
        checkWallHit(snake.bodyParts.first.cellPosition)) {
      ref.read(gameSessionProvider.notifier).finishGame();
    }
  }

  int _calculateScore(Snake snake) =>
      snake.bodyParts.length - GameConstants.defaultSnake.bodyParts.length;

  void _restartGame() {
    ref.read(snakeProvider.notifier).setToDefault();
    ref.read(foodProvider.notifier).setToDefault();
    ref.read(gameSessionProvider.notifier).resetGame();
    _enteredDirections.clear();
  }

  @override
  Widget build(BuildContext context) {
    double boardSize = MediaQuery.of(context).size.height * 0.8;
    double boardCellSize = boardSize / GameConstants.boardCellsNumber;

    SnakeNotifier snakeNotifier = ref.read(snakeProvider.notifier);
    FoodNotifier foodNotifier = ref.read(foodProvider.notifier);
    GameSessionNotifier gameSessionNotifier =
        ref.read(gameSessionProvider.notifier);

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
          if (listOfDirectionKeys.contains(event.logicalKey)) {
            _enteredDirections.add(mapOfDirectionKeys[event.logicalKey]!);
          }
        }
      },
      focusNode: FocusNode(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            AssetsStrings.score(_calculateScore(snake)),
            style: AssetsFonts.h1(AssetsColors.black),
          ),
          Container(
            decoration: BoxDecoration(
                color: AssetsColors.black,
                border: Border.all(color: AssetsColors.black, width: 3)),
            child: Container(
              width: boardSize,
              height: boardSize,
              decoration: const BoxDecoration(color: AssetsColors.darkGreen),
              child: Stack(
                children: [
                  ...widget.draw(snake, food, boardCellSize),
                  if (gameSession.gameStatus == GameStatus.none) ...[
                    Center(
                        child: GameLauncherDialog(
                            onStartGamePressed: () =>
                                gameSessionNotifier.startGame()))
                  ],
                  if (gameSession.gameStatus == GameStatus.over) ...[
                    Center(child: GameOverDialog(onTryAgain: _restartGame))
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
