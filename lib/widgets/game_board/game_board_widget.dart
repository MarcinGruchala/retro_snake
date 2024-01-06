import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/theme/color_extension.dart';


import '../../assets/assets.dart';
import '../../game_constants.dart';
import '../../model/enums/direction.dart';
import '../../model/enums/game_status.dart';
import '../../model/enums/snake_body_part_type.dart';
import '../../model/food.dart';
import '../../model/game_board_state/game_board_state.dart';
import '../../model/portal/portal.dart';
import '../../provider/food/food_notifier.dart';
import '../../provider/food/food_provider.dart';
import '../../provider/game_board_state_provider.dart';
import '../../provider/game_session/game_session.dart';
import '../../provider/game_session/game_session_notifier.dart';
import '../../provider/game_session/game_session_provider.dart';
import '../../provider/snake/snake.dart';
import '../../provider/snake/snake_notifier.dart';
import '../../provider/snake/snake_provider.dart';
import '../../utils/calculate_board_size.dart';
import '../../utils/hit_detection.dart';
import '../../utils/input_and_direction.dart';
import '../food_widget.dart';
import '../snake/snake_body_part_widget.dart';
import '../snake/snake_round_widget.dart';
import 'game_launcher_dialog.dart';
import 'game_over_dialog.dart';

class GameBoardWidget extends ConsumerStatefulWidget {
  const GameBoardWidget({Key? key}) : super(key: key);

  static const scoreHeightBreakpoint = 430;

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

  Future<void> _performGameFrame() async {
    SnakeNotifier snakeNotifier = ref.read(snakeProvider.notifier);
    FoodNotifier foodNotifier = ref.read(foodProvider.notifier);
    List<Portal> portals = ref.read(gameBoardStateProvider).portals;
    GameSessionNotifier gameSessionNotifier =
        ref.read(gameSessionProvider.notifier);

    final gameBoardState = ref.watch(gameBoardStateProvider);

    if (gameBoardState.gameSession.gameStatus == GameStatus.running) {
      _updateSnakeDirection(gameBoardState.snake, snakeNotifier);
      if (_isHitDetected(gameBoardState.snake, gameSessionNotifier)) {
        await gameSessionNotifier.finishGame();
        return;
      }
      snakeNotifier.moveSnake(portals);
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

  bool _isHitDetected(
    Snake snake,
    GameSessionNotifier gameSessionNotifier,
  ) {
    if (checkSnakeHit(snake) || checkWallHit(snake.head.cellPosition)) {
      return true;
    }
    return false;
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
      foodNotifier.generateNewFood(gameBoardState);
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
    double boardSize = calculateBoardSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    double boardCellSize = boardSize / GameConstants.boardCellsNumber;

    GameBoardState gameBoardState = ref.watch(gameBoardStateProvider);
    Snake snake = gameBoardState.snake;
    Food food = gameBoardState.food;
    List<Portal> portals = gameBoardState.portals;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (MediaQuery.of(context).size.height >
              GameBoardWidget.scoreHeightBreakpoint)
            Text(
              AssetsStrings.score(gameSession.score),
              style: AssetsFonts.h1(context.colors.primary),
            ),
          Container(
            decoration: blackContainer(context),
            child: Container(
              width: boardSize,
              height: boardSize,
              decoration: BoxDecoration(color: context.colors.background),
              child: Stack(
                children: [
                  GameElements(
                    snake: snake,
                    food: food,
                    gameSession: gameSession,
                    portals: portals,
                    boardCellSize: boardCellSize,
                  ),
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

class GameElements extends StatelessWidget {
  final Snake snake;
  final Food food;
  final GameSession gameSession;
  final List<Portal> portals;
  final double boardCellSize;

  const GameElements({
    super.key,
    required this.snake,
    required this.food,
    required this.gameSession,
    required this.portals,
    required this.boardCellSize,
  });

  List<Widget> draw(
    BuildContext context,
    Snake snake,
    Food food,
    GameSession gameSession,
    List<Portal> portals,
    double boardCellSize,
  ) {
    List<Widget> snakeWidgets = snake.bodyParts.asMap().entries.map((entry) {
      if (entry.value.bodyPartType == SnakeBodyPartType.head) {
        return SnakeRoundWidget(
            xPosition: entry.value.cellPosition.x * boardCellSize,
            yPosition: entry.value.cellPosition.y * boardCellSize,
            size: boardCellSize,
            color: context.colors.primary,
            direction: snake.direction);
      }
      if (entry.key == snake.bodyParts.length - 1) {
        return SnakeRoundWidget(
            xPosition: entry.value.cellPosition.x * boardCellSize,
            yPosition: entry.value.cellPosition.y * boardCellSize,
            size: boardCellSize,
            direction: snake.calculateTailDirection(),
            color: context.colors.primary);
      }
      return SnakeBodyPartWidget(
        xPosition: entry.value.cellPosition.x * boardCellSize,
        yPosition: entry.value.cellPosition.y * boardCellSize,
        size: boardCellSize,
        color: context.colors.primary,
      );
    }).toList();
    Widget foodWidget = FoodWidget(
      xPosition: food.cellPosition.x * boardCellSize,
      yPosition: food.cellPosition.y * boardCellSize,
      size: boardCellSize,
      score: food.score,
      isActive: gameSession.gameStatus == GameStatus.running,
    );
    List<Widget> portalWidgets = portals
        .map(
          (e) => e.mapToPortalWidgets(
              boardCellSize: boardCellSize,
              isActive: gameSession.gameStatus == GameStatus.running),
        )
        .toList()
        .expand((element) => element)
        .toList();

    return [
      foodWidget,
      ...portalWidgets,
      ...snakeWidgets,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...draw(
          context,
          snake,
          food,
          gameSession,
          portals,
          boardCellSize,
        ),
      ],
    );
  }
}
