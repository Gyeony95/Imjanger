import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppFireStore {
  AppFireStore._(); // 생성자를 private으로 설정

  static final FirebaseFirestore _db =
      FirebaseFirestore.instance; // 인스턴스를 private로 선언하고 초기화

  static FirebaseFirestore get getInstance => _db; // public getter를 통해 인스턴스에 접근
}
