import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../assets/assets.dart';
import 'common/ink_well_transparent.dart';
import 'common/on_hover_text.dart';

class OriginInfo extends StatelessWidget {
  const OriginInfo({super.key});

  final String _sourceCodeUrl = "https://github.com/MarcinGruchala/retro_snake";

  @override
  Widget build(BuildContext context) {
    return InkWellTransparent(
      onTap: () => launchUrlString(_sourceCodeUrl),
      child: const OnHoverText(
        text: AssetsStrings.sourceCode,
      ),
    );
  }
}
