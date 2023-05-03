import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retro_snake/assets/assets.dart';
import 'package:retro_snake/provider/version_provider.dart';
import 'package:retro_snake/widgets/common/text/retro_text_p1.dart';

import 'game_board.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String version = ref.watch(versionProvider);

    return Scaffold(
      backgroundColor: AssetsColors.darkGreen,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const GameBoardWidget(),
            Align(
              alignment: Alignment.bottomRight,
              child:
                  RetroTextP1(AssetsStrings.version(version)),
            )
          ],
        ),
      ),
    );
  }
}
