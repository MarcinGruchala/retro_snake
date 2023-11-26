import 'package:flutter/cupertino.dart';
import 'package:retro_snake/theme/color_extension.dart';

BoxDecoration boardDialogDecoration(BuildContext context) => BoxDecoration(
      color: context.colors.background,
      border: Border.all(color: context.colors.primary, width: 3),
    );
