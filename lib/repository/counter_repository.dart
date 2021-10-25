import 'package:cloud_firestore/cloud_firestore.dart';

class CounterRepository {
  CounterRepository._privateConstructor();
  final _db = FirebaseFirestore.instance;

  static final CounterRepository _instance =
      CounterRepository._privateConstructor();

  factory CounterRepository() {
    return _instance;
  }
  Future<String> getCountForPageOne() async {
    final snapshot = await _db.collection('page_one').doc('count').get(
          const GetOptions(source: Source.server),
        );
    String data = '0';
    if (snapshot.exists) {
      data = snapshot.data()?['value'].toString() ?? '0';
    }
    return data;
  }

  Stream<String> getCountForPageTwo() {
    return _db
        .collection('page_two')
        .doc('count')
        .snapshots()
        .map((event) => event.data()?['value'].toString() ?? '0');
  }

  Future<void> updateCountInPageOne({required int value}) async {
    await _db.collection('page_one').doc('count').set({'value': value});
  }

  Future<void> updateCountInPageTwo({required int value}) async {
    await _db.collection('page_two').doc('count').set({'value': value});
  }
}
