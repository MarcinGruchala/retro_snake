import 'package:flutter/cupertino.dart';

import 'assets_colors.dart';

class AssetsDecoration {
  static BoxDecoration blackContainer = BoxDecoration(
      color: AssetsColors.black,
      border: Border.all(
        color: AssetsColors.black,
        width: 3,
      ));

  static BoxDecoration blackFrame = BoxDecoration(
      border: Border.all(
        color: AssetsColors.black,
        width: 3,
      ));
}
