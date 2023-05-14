import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'game_session.dart';
import 'game_session_notifier.dart';

final gameSessionProvider =
    StateNotifierProvider.autoDispose<GameSessionNotifier, GameSession>((ref) {
  return GameSessionNotifier();
});
