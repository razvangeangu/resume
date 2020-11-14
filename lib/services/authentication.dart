import 'package:Resume/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static final Authentication _instance = Authentication();
  static Authentication get instance => _instance;

  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email.toLowerCase().trim(),
      password: password,
    );

    await Database.instance.createUserCollection(result?.user?.uid);

    return result?.user;
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    UserCredential result = await _auth.signInWithEmailAndPassword(
      email: email.toLowerCase().trim(),
      password: password,
    );

    await Database.instance.createUserCollection(result?.user?.uid);

    return result?.user;
  }

  Future<void> logOut() async {
    return await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    return await _auth.sendPasswordResetEmail(
        email: email.toLowerCase().trim());
  }

  Stream<User> authStateChanges() {
    return _auth.authStateChanges();
  }
}
