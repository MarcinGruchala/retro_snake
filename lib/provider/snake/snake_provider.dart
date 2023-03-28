import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/snake.dart';
import 'snake_notifier.dart';

final snakeProvider = StateNotifierProvider<SnakeNotifier, Snake>((ref) {
  return SnakeNotifier();
});
