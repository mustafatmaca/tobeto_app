import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tobeto_app/models/user.dart';

class FirebaseAuthRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final firebaseFirestoreInstance = FirebaseFirestore.instance;

  Future<String> signIn(String email, String password) async {
    try {
      final userCredentials = await firebaseAuthInstance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredentials);
      return "Giriş Başarılı!";
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message!;
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

  Future<String> register(String name, String surname, String email,
      String password, String confirmPassword) async {
    if (password == confirmPassword) {
      try {
        final userCredentials = await firebaseAuthInstance
            .createUserWithEmailAndPassword(email: email, password: password);

        firebaseFirestoreInstance
            .collection("users")
            .doc(userCredentials.user!.uid)
            .set(UserModel(name: name, surname: surname, email: email).toMap());
        print(userCredentials);
        return "Kayıt Başarılı!";
      } on FirebaseAuthException catch (e) {
        print(e.message);
        if (e.message ==
            "The email address is already in use by another account.") {
          return "Bu mail kullanılıyor!";
        } else if (e.message == "Password should be at least 6 characters") {
          return "Şifre en az 6 karakterden oluşmalı!";
        }
        return e.message!;
      }
    } else {
      return "Parolalar Uyuşmuyor!";
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
