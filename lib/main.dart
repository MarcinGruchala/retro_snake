import 'package:flutter/material.dart';
import 'package:retro_snake/assets/AssetsColors.dart';
import 'package:retro_snake/game_constants.dart';

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

  @override
  Widget build(BuildContext context) {
    boardSize = MediaQuery.of(context).size.height * 0.8;
    boardCellSize = boardSize / GameConstants.boardCellsNumber;
    return Container(
      width: boardSize,
      height: boardSize,
      decoration: BoxDecoration(color: Color(0xff9370DB)),
      child: Stack(
        children: [
          SnakeBodyPart(
            color: AssetsColors.yellow,
            xPosition: 5 * boardCellSize,
            yPosition: 5 * boardCellSize,
            size: boardSize / GameConstants.boardCellsNumber,
          )
        ],
      ),
    );
  }
}

class SnakeBodyPart extends StatelessWidget {
  final Color color;
  final double xPosition;
  final double yPosition;
  final double size;

  const SnakeBodyPart({
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
