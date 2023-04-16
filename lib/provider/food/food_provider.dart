import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/food.dart';
import 'food_notifier.dart';

final foodProvider = StateNotifierProvider.autoDispose<FoodNotifier, Food>(
    (ref) => FoodNotifier());
