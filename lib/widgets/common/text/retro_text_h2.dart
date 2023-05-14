import 'package:flutter/material.dart';

import '../../../assets/assets.dart';

class RetroTextH2 extends StatelessWidget {
  final String data;

  const RetroTextH2(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: AssetsFonts.h2(AssetsColors.black),
    );
  }
}
