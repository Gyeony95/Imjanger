import 'package:flutter/material.dart';
import 'package:imjanger/screens/base/base_view_model.dart';
import 'package:imjanger/screens/home/home_screen.dart';
import 'package:imjanger/screens/map/map_screen.dart';

class HomeViewModel extends BaseViewModel{
  HomeTap currentHomeTap = HomeTap.map;

  late List<Widget> bottomItems;

  @override
  void onInit() {
    super.onInit();
    bottomItems = [
      MapScreen(),
      const SizedBox(),
      const SizedBox(),
    ];
  }


  void onBottomItemTapped(HomeTap type) {
    if (currentHomeTap == type) return;
    switch (type) {
      case HomeTap.map:
        bottomItems[type.code] = MapScreen();
        break;
      case HomeTap.list:
        bottomItems[type.code] = const SizedBox();
        break;
      case HomeTap.my:
        bottomItems[type.code] = const SizedBox();
        break;
    }
    currentHomeTap = type;
    notifyListeners();
  }
}