import 'package:flutter/material.dart';

abstract class AppColors {
  static Color transparent = Colors.transparent;

  static Color white = Colors.white;
  static Color black = Colors.black;


  // https://www.theteams.kr/teams/866/post/67528
  // 위 링크에서 가져온 그레이스케일
  static Color gray50 = const Color(0xfffafafa);
  static Color gray100 = const Color(0xfff5f5f5);
  static Color gray200 = const Color(0xffeeeeee);
  static Color gray300 = const Color(0xffe0e0e0);
  static Color gray400 = const Color(0xffbdbdbd);
  static Color gray500 = const Color(0xff9e9e9e);
  static Color gray600 = const Color(0xff757575);
  static Color gray700 = const Color(0xff616161);
  static Color gray800 = const Color(0xff424242);
  static Color gray900 = const Color(0xff212121);


  // https://colorhunt.co/palette/f1eaffe5d4ffdcbfffd0a2f7
  static Color main50 = const Color(0xffF1EAFF);
  static Color main100 = const Color(0xffE5D4FF);
  static Color main200 = const Color(0xffDCBFFF);
  static Color main300 = const Color(0xffD0A2F7);
  static Color main400 = const Color(0xffC683D7);
  static Color main500 = const Color(0xff7071E8);


  static Color primaryBase = const Color(0xFF6A3EA1);
  static Color primaryDark = const Color(0xFF3A2258);
  static Color primaryLight = const Color(0xFFEFE9F7);
  static Color primaryBackground = const Color(0xFFFAF8FC);

  static Color secondaryBase = const Color(0xFFDEDC52);
  static Color secondaryDark = const Color(0xFF565510);
  static Color secondaryLight = const Color(0xFFF7F6D4);

  static Color successBase = const Color(0xFF60D889);
  static Color successDark = const Color(0xFF1F7F40);
  static Color successLight = const Color(0xFFDAF6E4);

  static Color errorBase = const Color(0xFFCE3A54);
  static Color errorDark = const Color(0xFF5A1623);
  static Color errorLight = const Color(0xFFF7DEE3);

  static Color warningBase = const Color(0xFFF8C715);
  static Color warningDark = const Color(0xFF725A03);
  static Color warningLight = const Color(0xFFFDEBAB);
}
