import 'package:flutter/material.dart';
import 'package:retro_snake/theme/color_theme.dart';

extension BuildContextColors on BuildContext {
  ColorTheme get colors => Theme.of(this).extension<ColorTheme>()!;
}
