import 'package:flutter/material.dart';
import 'package:retro_snake/assets/assets.dart';

import 'game_board.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AssetsColors.darkGreen,
      body: Center(child: GameBoardWidget()),
    );
  }
}
