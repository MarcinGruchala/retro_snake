import 'package:firebase_database/firebase_database.dart';

Future<bool> updateRecordOverall(int gameResult) async {
  final database = FirebaseDatabase.instance;
  final recordOverallRef = database.ref('record_overall');
  final DataSnapshot recordOverallSnapshot = await recordOverallRef.get();
  final int recordOverall = recordOverallSnapshot.value as int;
  if (gameResult > recordOverall) {
    await recordOverallRef.set(gameResult);
    return true;
  }
  return false;
}
