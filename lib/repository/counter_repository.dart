import 'package:firebase_database/firebase_database.dart';

class CounterRepository {
  CounterRepository._privateConstructor();
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  static final CounterRepository _instance =
      CounterRepository._privateConstructor();

  factory CounterRepository() {
    return _instance;
  }
  Future<String> getCountFromDatabase() async {
    final snapshot = await _db.reference().child('counter').get();
    String data = '0';
    if (snapshot.exists) {
      data = snapshot.value['value'].toString();
    }
    return data;
  }

  Future<void> updateCountInDatabase({required int value}) async {
    final ref = _db.reference().child('counter');
    await ref.update({'value': value.toString()});
  }
}
