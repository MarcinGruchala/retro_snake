import 'package:flutter/material.dart';

import '../../../assets/assets.dart';

class RetroTextP1 extends StatelessWidget {
  final String data;

  const RetroTextP1(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: AssetsFonts.p1(AssetsColors.black),
    );
  }
}
