import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'color_theme.dart';

final themeProvider = Provider.autoDispose<ThemeData>((ref) {
  final colorTheme = ref.watch(colorThemeProvider);

  return ThemeData(
    extensions: [colorTheme],
  );
});
