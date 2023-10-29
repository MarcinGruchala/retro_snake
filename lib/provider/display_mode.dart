import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/enums/display_mode.dart';

final displayModeProvider =
    StateProvider.autoDispose<DisplayMode>((_) => DisplayMode.classic);
