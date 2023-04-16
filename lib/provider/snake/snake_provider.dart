import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'snake.dart';
import 'snake_notifier.dart';

final snakeProvider = StateNotifierProvider.autoDispose<SnakeNotifier, Snake>((ref) {
  return SnakeNotifier();
});
