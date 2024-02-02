import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final firebaseFirestoreInstance = FirebaseFirestore.instance;

  void signIn(String email, String password) async {
    try {
      final userCredentials = await firebaseAuthInstance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredentials);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      final userCredential =
          await firebaseAuthInstance.signInWithCredential(credential);
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void logout() async {
    try {
      await firebaseAuthInstance.signOut();
    } catch (e) {
      print(e);
    }
  }

  void register(String email, String password) async {
    try {
      final userCredentials = await firebaseAuthInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseFirestoreInstance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set(
        {
          'email': email,
        },
      );
      print(userCredentials);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  void forgotPassword(String email) async {
    try {
      await firebaseAuthInstance.setLanguageCode('tr');
      await firebaseAuthInstance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }
}
