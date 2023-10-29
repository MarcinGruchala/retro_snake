import 'package:flutter/cupertino.dart';
import 'package:retro_snake/theme/color_extension.dart';

BoxDecoration blackContainer(BuildContext context) => BoxDecoration(
    color: context.colors.primary,
    border: Border.all(
      color: context.colors.primary,
      width: 3,
    ));

BoxDecoration blackFrame(BuildContext context) => BoxDecoration(
        border: Border.all(
      color: context.colors.primary,
      width: 3,
    ));
