import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RGUser {
  String uid;

  RGUser({
    @required this.uid,
  });

  static RGUser fromSnapshot(DocumentSnapshot snapshot) {
    final user = RGUser(uid: null);
    if (snapshot == null) return user;

    user.uid = snapshot.id;

    return user;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
