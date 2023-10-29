import 'package:flutter/material.dart';
import 'package:retro_snake/theme/color_extension.dart';

import '../../../assets/assets.dart';

class RetroTextP1 extends StatelessWidget {
  final String data;
  final Color? color;

  const RetroTextP1(this.data, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      style: AssetsFonts.p1(color ?? context.colors.primary),
    );
  }
}
