import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/models/application.dart';

class FireStoreRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final FirebaseFirestoreInstance = FirebaseFirestore.instance;

  Future<List<Application>> getApplications() async {
    //giriş yapmış olan kullanıcıyı getirir
    final user = await FirebaseFirestoreInstance.collection("users")
        .doc(firebaseAuthInstance.currentUser!.uid);
    final docSnapShot = await user.get();

    //kullanıcının içindeki başvurular listesini döndürür
    List appsId = await docSnapShot.get("applications");

    // asenkron olduğu için içinde Future<Application>'lar tutan liste
    final appList = appsId.map(
      (e) async {
        //kullanıcıdaki applications id'sine göre applications collection'undan application'ları getirir
        final docRef =
            FirebaseFirestoreInstance.collection("applications").doc(e["id"]);
        final appSnapshot = await docRef.get();
        // gelen applicationları bizim oluşturduğumuz modellere dönüştürür.
        return Application.fromMap(appSnapshot.data()!, e["state"]);
      },
    ).toList();

    // Tüm asenkron işlemleri bekleyerek Future<List<Application>>'a dönüştürme
    List<Application> resolvedAppList = await Future.wait(appList);

    return resolvedAppList;
  }
}
