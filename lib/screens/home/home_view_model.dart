import 'package:imjanger/screens/base/base_view_model.dart';
import 'package:imjanger/screens/home/home_screen.dart';

class HomeViewModel extends BaseViewModel{
  HomeTap currentHomeTap = HomeTap.list;




  @override
  void onInit() {
    super.onInit();
  }


  void onBottomItemTapped(HomeTap type) {
    if (currentHomeTap == type) return;
    currentHomeTap = type;
    notifyListeners();
  }
}