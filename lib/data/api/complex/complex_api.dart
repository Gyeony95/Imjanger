import 'package:imjanger/data/firebase/firebase_store_db.dart';
import 'package:imjanger/data/model/complex_model.dart';

class ComplexApi with AppFireStore {
  Future<List<ComplexModel>> getRecentComplex() async {
    var docs = await getDocs('complex_list');
    return docs.map((e) => ComplexModel.fromDoc(e)).toList();
  }
}
