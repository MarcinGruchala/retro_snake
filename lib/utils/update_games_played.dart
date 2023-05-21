import 'package:firebase_database/firebase_database.dart';

Future updateGamesPlayed() async {
  final database = FirebaseDatabase.instance;
  final gamesPlayedRef = database.ref('games_played');
  final DataSnapshot gamesPlayedSnapshot = await gamesPlayedRef.get();
  final int gamesPlayed = gamesPlayedSnapshot.value as int;
  await gamesPlayedRef.set(gamesPlayed + 1);
}
