import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/assets/assets_decoration.dart';
import 'package:retro_snake/model/enums/game_status.dart';
import 'package:retro_snake/provider/food/food_notifier.dart';
import 'package:retro_snake/provider/food/food_provider.dart';
import 'package:retro_snake/provider/game_session/game_session.dart';
import 'package:retro_snake/provider/game_session/game_session_notifier.dart';
import 'package:retro_snake/provider/game_session/game_session_provider.dart';
import 'package:retro_snake/provider/snake/snake_notifier.dart';
import 'package:retro_snake/provider/snake/snake_provider.dart';
import 'package:retro_snake/utils/update_games_played.dart';
import 'package:retro_snake/widgets/food_widget.dart';
import 'package:retro_snake/widgets/game_board/game_board_state.dart';
import 'package:retro_snake/widgets/game_board/game_launcher_dialog.dart';
import 'package:retro_snake/widgets/game_board/game_over_dialog.dart';
import 'package:retro_snake/widgets/snake/snake_round_widget.dart';

import '../../game_constants.dart';
import '../../model/enums/direction.dart';
import '../../model/enums/snake_body_part_type.dart';
import '../../model/food.dart';
import '../../provider/game_board_state_provider.dart';
import '../../provider/snake/snake.dart';
import '../../utils/hit_detection.dart';
import '../../utils/input_and_direction.dart';
import '../snake/snake_body_part_widget.dart';

class GameBoardWidget extends ConsumerStatefulWidget {
  const GameBoardWidget({Key? key}) : super(key: key);

  List<Widget> draw(
    Snake snake,
    Food food,
    double boardCellSize,
  ) {
    List<Widget> snakeWidgets = snake.bodyParts.asMap().entries.map((entry) {
      if (entry.value.bodyPartType == SnakeBodyPartType.head) {
        return SnakeRoundWidget(
            xPosition: entry.value.cellPosition.x * boardCellSize,
            yPosition: entry.value.cellPosition.y * boardCellSize,
            size: boardCellSize,
            color: AssetsColors.black,
            direction: snake.direction);
      }
      if (entry.key == snake.bodyParts.length - 1) {
        return SnakeRoundWidget(
            xPosition: entry.value.cellPosition.x * boardCellSize,
            yPosition: entry.value.cellPosition.y * boardCellSize,
            size: boardCellSize,
            direction: snake.calculateTailDirection(),
            color: AssetsColors.black);
      }
      return SnakeBodyPartWidget(
        xPosition: entry.value.cellPosition.x * boardCellSize,
        yPosition: entry.value.cellPosition.y * boardCellSize,
        size: boardCellSize,
        color: AssetsColors.black,
      );
    }).toList();
    Widget foodWidget = FoodWidget(
      xPosition: food.cellPosition.x * boardCellSize,
      yPosition: food.cellPosition.y * boardCellSize,
      size: boardCellSize,
      score: food.score,
    );
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
      _performGameFrame();
    });
  }

  void _performGameFrame() {
    SnakeNotifier snakeNotifier = ref.read(snakeProvider.notifier);
    FoodNotifier foodNotifier = ref.read(foodProvider.notifier);
    GameSessionNotifier gameSessionNotifier =
        ref.read(gameSessionProvider.notifier);

    final gameBoardState = ref.watch(gameBoardStateProvider);

    if (gameBoardState.gameSession.gameStatus == GameStatus.running) {
      _updateSnakeDirection(gameBoardState.snake, snakeNotifier);
      snakeNotifier.moveSnake();
      _handleHitDetection(gameBoardState.snake, gameSessionNotifier);
      _handleFood(
        gameBoardState,
        snakeNotifier,
        foodNotifier,
        gameSessionNotifier,
      );
    }
  }

  void _updateSnakeDirection(Snake snake, SnakeNotifier snakeNotifier) {
    if (_enteredDirections.isNotEmpty) {
      Direction nextDirection =
          takeFirstValidDirection(snake, _enteredDirections);
      snakeNotifier.changeDirection(nextDirection);
    }
  }

  Future<void> _handleHitDetection(
      Snake snake, GameSessionNotifier gameSessionNotifier) async {
    if (checkSnakeHit(snake) || checkWallHit(snake.head.cellPosition)) {
      await gameSessionNotifier.finishGame();
    }
  }

  void _handleFood(
    GameBoardState gameBoardState,
    SnakeNotifier snakeNotifier,
    FoodNotifier foodNotifier,
    GameSessionNotifier gameSessionNotifier,
  ) {
    if (_checkFoodHit(gameBoardState.snake, gameBoardState.food)) {
      snakeNotifier.eat();
      gameSessionNotifier.addScore(gameBoardState.food.score);
      foodNotifier.generateNewFood(gameBoardState.snake);
    }
    foodNotifier.lowerScoreIfPossible();
  }

  bool _checkFoodHit(Snake snake, Food food) {
    return snake.head.cellPosition == food.cellPosition;
  }

  void _restartGame() {
    ref.read(snakeProvider.notifier).setToDefault();
    ref.read(foodProvider.notifier).setToDefault();
    ref.read(gameSessionProvider.notifier).resetGame();
    _enteredDirections.clear();
  }

  void _startGame() {
    ref.read(gameSessionProvider.notifier).startGame();
  }

  @override
  Widget build(BuildContext context) {
    double boardSize = MediaQuery.of(context).size.height * 0.8;
    double boardCellSize = boardSize / GameConstants.boardCellsNumber;

    GameBoardState gameBoardState = ref.watch(gameBoardStateProvider);
    Snake snake = gameBoardState.snake;
    Food food = gameBoardState.food;
    GameSession gameSession = gameBoardState.gameSession;

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
            AssetsStrings.score(gameSession.score),
            style: AssetsFonts.h1(AssetsColors.black),
          ),
          Container(
            decoration: AssetsDecoration.blackContainer,
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
                            onStartGamePressed: () => _startGame()))
                  ],
                  if (gameSession.gameStatus == GameStatus.over) ...[
                    Center(
                        child: GameOverDialog(
                      onTryAgain: _restartGame,
                      isRecord: gameSession.isRecord,
                    ))
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
