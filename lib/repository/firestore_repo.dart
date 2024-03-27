import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobeto_app/constants/collection_names.dart';
import 'package:tobeto_app/models/announcement.dart';
import 'package:tobeto_app/models/application.dart';
import 'package:tobeto_app/models/catalog.dart';
import 'package:tobeto_app/models/education.dart';
import 'package:tobeto_app/models/exam.dart';
import 'package:tobeto_app/models/lesson.dart';
import 'package:tobeto_app/models/question.dart';
import 'package:tobeto_app/models/report.dart';
import 'package:tobeto_app/models/result.dart';
import 'package:tobeto_app/models/user.dart';

class FireStoreRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;
  final FirebaseFirestoreInstance = FirebaseFirestore.instance;

  //Kullanıcı bilgilerini firestore üzerinden getirme
  Future<UserModel> getUser() async {
    final userId = await firebaseAuthInstance.currentUser!.uid;
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(userId);

    final docSnapshot = await user.get();

    return UserModel.fromMap(docSnapshot.data()!);
  }

  //Kullanıcıya ait başvuruları firestore üzerinden getirme
  Future<List<Application>> getApplications() async {
    //giriş yapmış olan kullanıcıyı getirir
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    final docSnapShot = await user.get();

    // Hata durumunu kontrol et (kullanıcı var ve applications yoksa)
    if (docSnapShot.exists &&
        !docSnapShot.data()!.containsKey(Collections.APPLICATIONS)) {
      //'applications' alanı yok
      return []; // Boş bir liste döndür
    }

    //kullanıcının içindeki başvurular listesini döndürür
    List appsId = await docSnapShot.get(Collections.APPLICATIONS);

    // asenkron olduğu için içinde Future<Application>'lar tutan liste
    final appList = appsId.map(
      (e) async {
        //kullanıcıdaki applications id'sine göre applications collection'undan application'ları getirir
        final docRef =
            FirebaseFirestoreInstance.collection(Collections.APPLICATIONS)
                .doc(e["id"]);
        final appSnapshot = await docRef.get();
        // gelen applicationları bizim oluşturduğumuz modellere dönüştürür.
        return Application.fromMap(appSnapshot.data()!, e["state"]);
      },
    ).toList();

    // Tüm asenkron işlemleri bekleyerek Future<List<Application>>'a dönüştürme
    List<Application> resolvedAppList = await Future.wait(appList);

    return resolvedAppList;
  }

  //Kullanıcıya ait duyuruları firestore üzerinden getirme
  Future<List<Announcement>> getAnnouncements() async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    final docSnapShot = await user.get();

    // Hata durumunu kontrol et (kullanıcı var ve announcements yoksa)
    if (docSnapShot.exists &&
        !docSnapShot.data()!.containsKey(Collections.ANNOUNCEMENTS)) {
      //'announcements' alanı yok
      return []; // Boş bir liste döndür
    }

    List annoId = await docSnapShot.get(Collections.ANNOUNCEMENTS);

    final annoList = annoId.map(
      (e) async {
        final docRef =
            FirebaseFirestoreInstance.collection(Collections.ANNOUNCEMENTS)
                .doc(e);
        final appSnapshot = await docRef.get();
        return Announcement.fromMap(appSnapshot.data()!);
      },
    ).toList();

    List<Announcement> resolvedAnnoList = await Future.wait(annoList);
    resolvedAnnoList.sort(
      (a, b) {
        return b.date.compareTo(a.date);
      },
    );

    return resolvedAnnoList;
  }

  //Kullanıcıya ait sınavları firestore üzerinden getirme
  Future<List<Exam>> getExams() async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    final docSnapShot = await user.get();

    // Hata durumunu kontrol et (kullanıcı var ve exams yoksa)
    if (docSnapShot.exists &&
        !docSnapShot.data()!.containsKey(Collections.EXAMS)) {
      //'exams' alanı yok
      return []; // Boş bir liste döndür
    }

    List examsId = await docSnapShot.get(Collections.EXAMS);

    final examList = examsId.map(
      (e) async {
        final docRef =
            FirebaseFirestoreInstance.collection(Collections.EXAMS).doc(e);
        final examSnapshot = await docRef.get();
        return Exam.fromMap(examSnapshot.data()!);
      },
    ).toList();

    List<Exam> resolvedExamList = await Future.wait(examList);

    return resolvedExamList;
  }

  //Kullanıcıya ait eğitimleri firestore üzerinden getirme
  Future<List<Education>> getEducations() async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    final docSnapShot = await user.get();

    // Hata durumunu kontrol et (kullanıcı var ve educations yoksa)
    if (docSnapShot.exists &&
        !docSnapShot.data()!.containsKey(Collections.EDUCATIONS)) {
      //'educations' alanı yok
      return []; // Boş bir liste döndür
    }

    List eduId = await docSnapShot.get(Collections.EDUCATIONS);

    final eduList = eduId.map((e) async {
      final docRef =
          FirebaseFirestoreInstance.collection(Collections.EDUCATIONS)
              .doc(e['id']);
      final eduSnapshot = await docRef.get();
      return Education.fromMap(eduSnapshot.id, eduSnapshot.data()!, e['state']);
    }).toList();

    List<Education> resolvedEduList = await Future.wait(eduList);

    return resolvedEduList;
  }

  //Kullanıcıya ait takvim kısmında gösterilen dersleri firestore üzerinden getirme
  Future<List<Lesson>> getLessons() async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    final docSnapShot = await user.get();

    // Hata durumunu kontrol et (kullanıcı var ve educations yoksa)
    if (docSnapShot.exists &&
        !docSnapShot.data()!.containsKey(Collections.LESSONS)) {
      //'educations' alanı yok
      return []; // Boş bir liste döndür
    }

    List lessonId = await docSnapShot.get(Collections.LESSONS);

    final lessonList = lessonId.map((e) async {
      final docRef =
          FirebaseFirestoreInstance.collection(Collections.LESSONS).doc(e);
      final lessonSnapshot = await docRef.get();
      return Lesson.fromMap(lessonSnapshot.data()!);
    }).toList();

    List<Lesson> resolvedLessonList = await Future.wait(lessonList);

    return resolvedLessonList;
  }

  //Katalog kısmına ait eğitimleri firestore üzerinden getirme
  Future<List<Catalog>> getCatalog() async {
    final catalogs =
        await FirebaseFirestoreInstance.collection(Collections.CATALOGS).get();

    final catalogList = catalogs.docs.map((e) async {
      return Catalog.fromMap(e.data());
    }).toList();

    List<Catalog> resolvedCatalogList = await Future.wait(catalogList);

    return resolvedCatalogList;
  }

  // Değerlendirmeler kısmındaki raporları firestore üzerinden getirme
  Future<List<Report>> getReports() async {
    final reports =
        await FirebaseFirestoreInstance.collection(Collections.REPORTS).get();

    final reportList = reports.docs.map((e) async {
      return Report.fromMap(e.data());
    }).toList();

    List<Report> resolvedReportList = await Future.wait(reportList);

    return resolvedReportList;
  }

  Future<List<Question>> getQuestions(String examName) async {
    try {
      final snapshot = await FirebaseFirestoreInstance.collection("questions")
          .where("examName", isEqualTo: examName)
          .limit(25)
          .get();
      final questionList =
          snapshot.docs.map((e) => Question.fromMap(e.data())).toList();
      return questionList;
    } catch (e) {
      print("Bir hata oluştu");
      return [];
    }
  }

  Future<List<Result>> getResults(String userId) async {
    try {
      final snapshot = await FirebaseFirestoreInstance.collection("results")
          .where("userId", isEqualTo: userId)
          .get();
      final resultList =
          snapshot.docs.map((e) => Result.fromMap(e.data())).toList();
      return resultList;
    } catch (e) {
      print("Bir hata oluştu");
      return [];
    }
  }

  void setResult(Result result) async {
    try {
      await FirebaseFirestoreInstance.collection("results")
          .doc()
          .set(result.toMap());
      print("Sonuç Kaydı Başarılı!");
    } catch (e) {
      print("Bir hata oluştu");
    }
  }

  //Kullanıcının hakkında kısmında düzenleyebildiği verileri güncelleme
  void updateUserAbout(UserModel userModel, File? file) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);

    if (file != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child("${firebaseAuthInstance.currentUser!.uid}.jpg");
      await ref.putFile(file);
      final photoUrl = await ref.getDownloadURL();
      user.update(UserModel(
              name: userModel.name,
              surname: userModel.surname,
              email: userModel.email,
              photoUrl: photoUrl,
              gsm: userModel.gsm,
              birthdate: userModel.birthdate,
              adress: userModel.adress,
              about: userModel.about)
          .toMap());
    } else {
      user.update(UserModel(
              name: userModel.name,
              surname: userModel.surname,
              email: userModel.email,
              gsm: userModel.gsm,
              birthdate: userModel.birthdate,
              adress: userModel.adress,
              about: userModel.about)
          .toMap());
    }
  }

  //Kullanıcının eğitim hayatı kısmında düzenleyebildiği verileri güncelleme
  void updateUserGraduate(UserModel userModel) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    user.update(UserModel(
      name: userModel.name,
      surname: userModel.surname,
      email: userModel.email,
      graduates: userModel.graduates,
    ).toMap());
  }

  void updateUserExperience(UserModel userModel) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    user.update(UserModel(
      name: userModel.name,
      surname: userModel.surname,
      email: userModel.email,
      experiences: userModel.experiences,
    ).toMap());
  }

  void updateUserSkill(UserModel userModel) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    user.update(UserModel(
            name: userModel.name,
            surname: userModel.surname,
            email: userModel.email,
            skills: userModel.skills)
        .toMap());
  }

  void updateUserLanguage(UserModel userModel) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    user.update(UserModel(
            name: userModel.name,
            surname: userModel.surname,
            email: userModel.email,
            languages: userModel.languages)
        .toMap());
  }

  void updateUserSocial(UserModel userModel) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    user.update(UserModel(
            name: userModel.name,
            surname: userModel.surname,
            email: userModel.email,
            socials: userModel.socials)
        .toMap());
  }

  void updateUserCertificate(UserModel userModel, File? file) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    if (file != null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("files")
          .child("${file.path.substring(53)}");
      await ref.putFile(file);
      final url = await ref.getDownloadURL();
      user.update(UserModel(
          name: userModel.name,
          surname: userModel.surname,
          email: userModel.email,
          certificates: [...userModel.certificates!, url]).toMap());
    } else {
      user.update(UserModel(
          name: userModel.name,
          surname: userModel.surname,
          email: userModel.email,
          certificates: [...userModel.certificates!]).toMap());
    }
  }

  Future<List<Catalog>> getCatalogByTitle(String title) async {
    final catalogs =
        await FirebaseFirestoreInstance.collection(Collections.CATALOGS).get();

    final catalogList = catalogs.docs.map((e) async {
      return Catalog.fromMap(e.data());
    }).toList();

    List<Catalog> resolvedCatalogList = await Future.wait(catalogList);

    return resolvedCatalogList
        .where((element) =>
            element.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  Future<List<Education>> getEducationByTitle(String title) async {
    final user = await FirebaseFirestoreInstance.collection(Collections.USERS)
        .doc(firebaseAuthInstance.currentUser!.uid);
    final docSnapShot = await user.get();

    // Hata durumunu kontrol et (kullanıcı var ve educations yoksa)
    if (docSnapShot.exists &&
        !docSnapShot.data()!.containsKey(Collections.EDUCATIONS)) {
      //'educations' alanı yok
      return []; // Boş bir liste döndür
    }

    List eduId = await docSnapShot.get(Collections.EDUCATIONS);

    final eduList = eduId.map((e) async {
      final docRef =
          FirebaseFirestoreInstance.collection(Collections.EDUCATIONS)
              .doc(e['id']);
      final eduSnapshot = await docRef.get();
      return Education.fromMap(eduSnapshot.id, eduSnapshot.data()!, e['state']);
    }).toList();

    List<Education> resolvedEducationList = await Future.wait(eduList);

    return resolvedEducationList
        .where((element) =>
            element.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  void updateEduStatus(String eduId, int state) async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    DocumentSnapshot userSnapshot = await userDoc.get();
    if (!userSnapshot.exists) {
      print('Kullanıcı belgesi bulunamadı.');
      return;
    }

    dynamic userData = userSnapshot.data();
    if (userData == null || !userData.containsKey('educations')) {
      print('Kullanıcı verileri eksik veya hatalı.');
      return;
    }

    List<dynamic> educations = userData['educations'];

    print(educations);

    List<dynamic> changedEducations = educations.map((e) {
      if (e['id'] == eduId) {
        e['state'] = state;
      }
      return e;
    }).toList();

    print(changedEducations);

    await userDoc.update({'educations': changedEducations});
  }
}
