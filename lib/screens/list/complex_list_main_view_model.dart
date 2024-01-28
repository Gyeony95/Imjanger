import 'package:imjanger/data/api/complex/complex_api.dart';
import 'package:imjanger/data/model/complex_model.dart';
import 'package:imjanger/screens/base/base_view_model.dart';

class ComplexListMainViewModel extends BaseViewModel{

  final ComplexApi _api = ComplexApi();

  List<ComplexModel> recentComplexList = [];

  @override
  void onInit() {
    super.onInit();
    getComplexList();
  }

  Future<void> getComplexList() async {
    var docs = await _api.getRecentComplex();
    recentComplexList = docs;
    notifyListeners();
  }
}