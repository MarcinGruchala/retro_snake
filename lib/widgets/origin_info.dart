import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../assets/assets.dart';
import 'common/text/on_hover_text.dart';

class OriginInfo extends StatelessWidget {
  const OriginInfo({super.key});

  final String _sourceCodeUrl = "https://github.com/MarcinGruchala/retro_snake";
  final String sourceCode = AssetsStrings.sourceCode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => launchUrlString(_sourceCodeUrl),
        child: OnHoverText(text: sourceCode));
  }
}
