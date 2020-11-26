import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resume/models/firestore/rg-user.dart';

class FirestoreRoutes {
  static String get users {
    return 'users';
  }
}

class Database {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final Database _instance = Database();
  static Database get instance => _instance;

  Future<void> updateUserCollection(RGUser user) async {
    await _firestore
        .collection(FirestoreRoutes.users)
        .doc(user.uid)
        .update(user.toJson());
  }

  Future<void> createUserCollection(String uid) async {
    if (uid == null || uid == '') return;

    final userDocument = _firestore.collection(FirestoreRoutes.users).doc(uid);

    if (!(await userDocument.get()).exists) {
      return await userDocument.set(RGUser(uid: uid).toJson());
    }
  }

  Stream<RGUser> getUser(String uid) {
    if (uid == null) return Stream.value(RGUser(uid: null));

    return _firestore
        .doc('${FirestoreRoutes.users}/$uid')
        .snapshots()
        .map((snapshot) => RGUser.fromSnapshot(snapshot));
  }
}
