//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platos_app/models/weight_model.dart';

class WeightRepository {
  WeightRepository._privateConstructor();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final WeightRepository _instance =
      WeightRepository._privateConstructor();

  factory WeightRepository() {
    return _instance;
  }

  Future<void> updateWeightEntry(
      {required String weightId, required String weight}) async {
    await _firestore.collection('weightEntries').doc(weightId).update({
      'weight': weight,
    });
  }

  Future<void> deleteWeightEntry({required String weightId}) async {
    await _firestore.collection('weightEntries').doc(weightId).delete();
  }

  //
  Future<void> addWeightEntry({required String weight}) async {
    await _firestore.collection('weightEntries').add({
      'weight': weight,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  //Listens for changes in weight entries
  Stream<List<WeightModel>> getAllWeightEntries() {
    return _firestore
        .collection('weightEntries')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (event) => List<WeightModel>.from(event.docs.map(
            (e) => WeightModel.fromMap(
              e.data()
                ..addAll(
                  {
                    'id': e.id,
                  },
                ),
            ),
          )),
        );
  }
}
