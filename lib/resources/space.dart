import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Space {
  static final SizedBox appSpace2 = SizedBox(width: 2.w, height: 2.w);
  static final SizedBox appSpace4 = SizedBox(width: 4.w, height: 4.w);
  static final SizedBox appSpace8 = SizedBox(width: 8.w, height: 8.w);
  static final SizedBox appSpace12 = SizedBox(width: 12.w, height: 12.w);
  static final SizedBox appSpace16 = SizedBox(width: 16.w, height: 16.w);
  static final SizedBox appSpace24 = SizedBox(width: 24.w, height: 24.w);
  static final SizedBox appSpace32 = SizedBox(width: 32.w, height: 32.w);

  static final Widget sliverAppSpace2 =
      SliverToBoxAdapter(child: SizedBox(width: 2.w, height: 2.w));
  static final Widget sliverAppSpace4 =
      SliverToBoxAdapter(child: SizedBox(width: 4.w, height: 4.w));
  static final Widget sliverAppSpace8 =
      SliverToBoxAdapter(child: SizedBox(width: 8.w, height: 8.w));
  static final Widget sliverAppSpace12 =
      SliverToBoxAdapter(child: SizedBox(width: 12.w, height: 12.w));
  static final Widget sliverAppSpace16 =
      SliverToBoxAdapter(child: SizedBox(width: 16.w, height: 16.w));
  static final Widget sliverAppSpace24 =
      SliverToBoxAdapter(child: SizedBox(width: 24.w, height: 24.w));
  static final Widget sliverAppSpace32 =
      SliverToBoxAdapter(child: SizedBox(width: 32.w, height: 32.w));
}
