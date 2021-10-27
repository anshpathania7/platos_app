//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platos_app/models/user_model.dart';

class UserRepository {
  UserRepository._privateConstructor();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final UserRepository _instance = UserRepository._privateConstructor();

  factory UserRepository() {
    return _instance;
  }

  Future<void> updateUserEntry(
      {required String userId, required String name}) async {
    await _firestore.collection('userEntries').doc(userId).update({
      'name': name,
    });
  }

  Future<void> deleteUserEntry({required String userId}) async {
    await _firestore.collection('userEntries').doc(userId).delete();
  }

  //
  Future<void> addUserEntry({required String name}) async {
    await _firestore.collection('userEntries').add({
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<List<UserModel>> getAllUserEntries() async {
    final snapshot = await _firestore
        .collection('userEntries')
        .orderBy('createdAt', descending: true)
        .get();
    return List<UserModel>.from(
      snapshot.docs.map(
        (e) => UserModel.fromMap(
          e.data()
            ..addAll(
              {
                'id': e.id,
              },
            ),
        ),
      ),
    );
  }
}
