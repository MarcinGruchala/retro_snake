import 'package:flutter/material.dart';

import 'game_board.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff4B0082),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Center(child: GameBoardWidget())],
        ));
  }
}
