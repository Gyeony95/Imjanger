import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imjanger/resources/fonts.dart';

class TextStyles {
  static TextStyle preW100 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w100,
  );

  static TextStyle preW200 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w200,
  );

  static TextStyle preW300 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w300,
  );

  static TextStyle preW400 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w400,
  );

  static TextStyle preW500 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w500,
  );

  static TextStyle preW600 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w600,
  );

  static TextStyle preW700 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w700,
  );

  static TextStyle preW800 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w800,
  );

  static TextStyle preW900 = TextStyle(
    fontFamily: Fonts.pretendardVariable,
    fontVariations: FontVariations.w900,
  );

  static TextStyle pre(double weight, {double? size}) => TextStyle(
    fontVariations: [FontVariation('wght', weight)],
    fontSize: size ?? textBase,
  );


  static double get textXs => 10.sp;
  static double get text2Xs => 12.sp;
  static double get textSm => 14.sp;
  static double get textBase => 16.sp;
  static double get textLg => 20.sp;
  static double get textXl => 24.sp;
  static double get text2Xl => 32.sp;
  static double get text3Xl => 40.sp;
}
