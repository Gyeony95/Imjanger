import 'package:cloud_firestore/cloud_firestore.dart';

mixin AppFireStore {

  static final FirebaseFirestore _db =
      FirebaseFirestore.instance; // 인스턴스를 private로 선언하고 초기화

  static FirebaseFirestore get getInstance => _db; // public getter를 통해 인스턴스에 접근

  Future<List<DocumentSnapshot>> getDocs(String collectionPath) async {
    final snapshot = await _db.collection(collectionPath).get();
    return snapshot.docs;
  }

  Future<DocumentSnapshot> getDocsById(String collectionPath, {required String documentId}) async {
    return _db.collection(collectionPath).doc(documentId).get();
  }
}
