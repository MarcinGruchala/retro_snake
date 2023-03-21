import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/provider/snake/snake_notifier.dart';
import 'package:retro_snake/provider/snake/snake_provider.dart';

import 'assets/AssetsColors.dart';
import 'game_constants.dart';
import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';
import 'model/snake.dart';
import 'widgets/snake_body_part_widget.dart';

class GameBoard extends ConsumerWidget {
  const GameBoard({Key? key}) : super(key: key);

  List<Widget> draw(
    Snake snake,
    double boardCellSize,
  ) {
    return snake.bodyParts
        .map((e) => SnakeBodyPartWidget(
            color: e.bodyPartType == SnakeBodyPartType.head
                ? AssetsColors.yellow
                : AssetsColors.green,
            xPosition: e.xCellPosition * boardCellSize,
            yPosition: e.yCellPosition * boardCellSize,
            size: boardCellSize))
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double boardSize = MediaQuery.of(context).size.height * 0.8;
    double boardCellSize = boardSize / GameConstants.boardCellsNumber;

    SnakeNotifier snakeNotifier = ref.read(snakeProvider.notifier);
    Snake snake = ref.watch(snakeProvider);

    return RawKeyboardListener(
      autofocus: true,
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
            snakeNotifier.moveSnake(Direction.up);
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            snakeNotifier.moveSnake(Direction.down);
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            snakeNotifier.moveSnake(Direction.left);
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            snakeNotifier.moveSnake(Direction.right);
          }
        }
      },
      focusNode: FocusNode(),
      child: Container(
        width: boardSize,
        height: boardSize,
        decoration: const BoxDecoration(color: Color(0xff9370DB)),
        child: Stack(
          children: draw(snake, boardCellSize),
        ),
      ),
    );
  }
}
