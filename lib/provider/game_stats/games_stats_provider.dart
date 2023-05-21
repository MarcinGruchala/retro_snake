import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gamesPlayedProvider = StreamProvider<int>((ref) async* {
  final databaseRef = FirebaseDatabase.instance.ref('games_played');
  yield* databaseRef.onValue.map((event) {
    return event.snapshot.value as int;
  });
});

final recordOverallProvider = StreamProvider<int>((ref) async* {
  final databaseRef = FirebaseDatabase.instance.ref('record_overall');
  yield* databaseRef.onValue.map((event) {
    return event.snapshot.value as int;
  });
});

