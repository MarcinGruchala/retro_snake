import 'package:flutter/material.dart';

import '../../../assets/assets.dart';

class RetroTextP1 extends StatelessWidget {
  final String data;
  final Color? color;

  const RetroTextP1(this.data, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: AssetsFonts.p1(color ?? AssetsColors.black),
    );
  }
}
