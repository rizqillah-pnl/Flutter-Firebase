import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  static Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }

  static Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return 1;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream get firebaseUserStream => _auth.authStateChanges();
}
