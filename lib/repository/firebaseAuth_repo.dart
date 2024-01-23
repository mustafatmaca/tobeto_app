import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;

  void signIn(String email, String password) async {
    try {
      final userCredentials = await firebaseAuthInstance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredentials);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
