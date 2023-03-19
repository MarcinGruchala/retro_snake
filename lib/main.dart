import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retro_snake/assets/AssetsColors.dart';
import 'package:retro_snake/game_constants.dart';
import 'package:retro_snake/snake.dart';

import 'direction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retro snake',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4B0082),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: GameBoard())],
        ));
  }
}

class GameBoard extends StatelessWidget {
  GameBoard({Key? key}) : super(key: key);

  late double boardSize;
  late double boardCellSize;

  Snake snake = Snake(
    direction: Direction.down,
    bodyParts: [
      SnakeBodyPart(
          xCellPosition: 5,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.head),
      SnakeBodyPart(
          xCellPosition: 6,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 7,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 8,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 9,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
      SnakeBodyPart(
          xCellPosition: 10,
          yCellPosition: 5,
          bodyPartType: SnakeBodyPartType.body),
    ],
  );

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
  Widget build(BuildContext context) {
    boardSize = MediaQuery.of(context).size.height * 0.8;
    boardCellSize = boardSize / GameConstants.boardCellsNumber;
    return RawKeyboardListener(
      autofocus: true,
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
            print('up');
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            print('down');
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            print('left');
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            print('right');
          }
        }
      },
      focusNode: FocusNode(),
      child: Container(
        width: boardSize,
        height: boardSize,
        decoration: BoxDecoration(color: Color(0xff9370DB)),
        child: Stack(
          children: draw(snake, boardCellSize),
        ),
      ),
    );
  }
}

class SnakeBodyPartWidget extends StatelessWidget {
  final Color color;
  final double xPosition;
  final double yPosition;
  final double size;

  const SnakeBodyPartWidget({
    super.key,
    required this.color,
    required this.xPosition,
    required this.yPosition,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: xPosition,
        top: yPosition,
        child: Container(
          width: size,
          height: size,
          color: color,
        ));
  }
}
