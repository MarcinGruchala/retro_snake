import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retro_snake/assets/AssetsColors.dart';
import 'package:retro_snake/game_constants.dart';
import 'package:retro_snake/model/snake.dart';
import 'package:retro_snake/model/snake_body_part.dart';

import 'model/enums/direction.dart';
import 'model/enums/snake_body_part_type.dart';

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

class GameBoard extends StatefulWidget {
  GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late double boardSize;

  late double boardCellSize;

  Snake snake = GameConstants.defaultSnake;

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

  void moveSnake(Direction direction) {
    setState(() {
      snake = getNewSnakePosition(snake, direction);
    });
  }

  Snake getNewSnakePosition(Snake snake, Direction direction) {
    switch (direction) {
      case Direction.up:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition,
            yCellPosition: snake.bodyParts.first.yCellPosition - 1,
            bodyPartType: SnakeBodyPartType.head);

        List<SnakeBodyPart> newBodyParts = calculateNewBodyPosition(snake);
        return Snake(
            direction: direction, bodyParts: [newHead, ...newBodyParts]);
      case Direction.down:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition,
            yCellPosition: snake.bodyParts.first.yCellPosition + 1,
            bodyPartType: SnakeBodyPartType.head);
        List<SnakeBodyPart> newBodyParts = calculateNewBodyPosition(snake);
        return Snake(
            direction: direction, bodyParts: [newHead, ...newBodyParts]);
      case Direction.left:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition - 1,
            yCellPosition: snake.bodyParts.first.yCellPosition,
            bodyPartType: SnakeBodyPartType.head);

        List<SnakeBodyPart> newBodyParts = calculateNewBodyPosition(snake);
        return Snake(
            direction: direction, bodyParts: [newHead, ...newBodyParts]);
      case Direction.right:
        SnakeBodyPart newHead = SnakeBodyPart(
            xCellPosition: snake.bodyParts.first.xCellPosition + 1,
            yCellPosition: snake.bodyParts.first.yCellPosition,
            bodyPartType: SnakeBodyPartType.head);
        List<SnakeBodyPart> newBodyParts = calculateNewBodyPosition(snake);
        return Snake(
            direction: direction, bodyParts: [newHead, ...newBodyParts]);
    }
  }

  List<SnakeBodyPart> calculateNewBodyPosition(Snake snake) {
    List<SnakeBodyPart> newBodyParts = [];
    snake.bodyParts.asMap().forEach((key, value) {
      if (key != snake.bodyParts.length - 1) {
        newBodyParts.add(SnakeBodyPart(
            xCellPosition: snake.bodyParts[key].xCellPosition,
            yCellPosition: snake.bodyParts[key].yCellPosition,
            bodyPartType: SnakeBodyPartType.body));
      }
    });
    return newBodyParts;
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
            moveSnake(Direction.up);
            print('up');
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            moveSnake(Direction.down);
            print('down');
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            moveSnake(Direction.left);
            print('left');
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            moveSnake(Direction.right);
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
