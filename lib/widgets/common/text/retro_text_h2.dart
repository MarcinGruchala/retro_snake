import 'package:flutter/material.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../../../assets/assets.dart';

class RetroTextH2 extends StatelessWidget {
  final String data;

  const RetroTextH2(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      style: AssetsFonts.h2(context.colors.primary),
    );
  }
}
