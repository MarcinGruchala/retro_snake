import 'package:flutter_riverpod/flutter_riverpod.dart';

final versionProvider = Provider.autoDispose((ref) {
  return "0.1.0";
});
