import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/enums/display_mode.dart';
import '../provider/display_mode.dart';

final colorThemeProvider = Provider.autoDispose<ColorTheme>((ref) {
  final classicColorTheme = ref.read(classicColorThemeProvider);
  final alternativeColorTheme = ref.read(lightColorThemeProvider);
  final darkColorTheme = ref.read(darkColorThemeProvider);

  switch (ref.watch(displayModeProvider)) {
    case DisplayMode.dark:
      return darkColorTheme;
    case DisplayMode.light:
      return alternativeColorTheme;
    case DisplayMode.classic:
      return classicColorTheme;
  }
});

final darkColorThemeProvider = Provider.autoDispose<ColorTheme>((_) {
  return const ColorTheme(
    background: Color(0xff01080f),
    primary: Color(0xff40c81e),
    secondary: Color(0xffffffff),
  );
});

final lightColorThemeProvider = Provider.autoDispose<ColorTheme>((_) {
  return const ColorTheme(
    background: Color(0xFFFFFFFF),
    primary: Color(0xff578600),
    secondary: Color(0xff1a2300),
  );
});

final classicColorThemeProvider = Provider.autoDispose<ColorTheme>((_) {
  return const ColorTheme(
    background: Color(0xff578600),
    primary: Color(0xff1a2300),
    secondary: Color(0xFFFFFFFF),
  );
});

class ColorTheme extends ThemeExtension<ColorTheme> {
  final Color background;
  final Color primary;
  final Color secondary;

  const ColorTheme({
    required this.background,
    required this.primary,
    required this.secondary,
  });

  @override
  ThemeExtension<ColorTheme> copyWith({
    Color? background,
    Color? primary,
    Color? secondary,
  }) {
    return ColorTheme(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  ThemeExtension<ColorTheme> lerp(
    covariant ThemeExtension<ColorTheme>? other,
    double t,
  ) {
    if (other == null) return this;
    if (other is ColorTheme) {
      return ColorTheme(
        background:
            Color.lerp(background, other.background, t) ?? other.background,
        primary: Color.lerp(primary, other.primary, t) ?? other.primary,
        secondary: Color.lerp(secondary, other.secondary, t) ?? other.secondary,
      );
    }
    return this;
  }
}
