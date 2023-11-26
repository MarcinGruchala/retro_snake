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

const gameDialogWidth = 400.0;
const gameDialogHeight = 200.0;
