import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imjanger/enums/my_page_menu_enum.dart';
import 'package:imjanger/resources/colors.dart';
import 'package:imjanger/resources/resources.dart';
import 'package:imjanger/resources/space.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/screens/my_page/my_page_view_model.dart';
import 'package:imjanger/widgets/cached_image.dart';
import 'package:imjanger/widgets/imjang_app_bar.dart';

class MyPageMainScreen extends BaseScreen<MyPageMainViewModel> {
  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        const ImJangAppBar(title: ''),
        _profileBox(),
        _menuList(),
      ],
    );
  }

  Widget _profileBox() {
    return Container(
      height: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.gray200, width: 1))),
      child: Row(
        children: [
          _profileImage(),
          Space.appSpace8,
          Text(
            '떡상기원1일차',
            style: TextStyles.preW700.copyWith(
              fontSize: 18.sp,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(Svgs.icRightArrow, width: 12.w, height: 12.w),
        ],
      ),
    );
  }

  Widget _profileImage() {
    String url =
        'https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221214144619159434.jpg';
    return CachedImage(
      url: url,
      height: 64.w,
      width: 64.w,
      borderRadius: BorderRadius.circular(100),
    );
  }

  Widget _menuList() {
    return Column(
      children: [...List.generate(MyPageMenuEnum.values.length, _menuItem)],
    );
  }

  Widget _menuItem(int index) {
    var type = MyPageMenuEnum.values[index];
    return Container(
      height: 60.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(
      //       color: AppColors.gray200,
      //       width: 1,
      //     ),
      //   ),
      // ),
      child: Row(
        children: [
          Text(
            type.title,
            style: TextStyles.preW600.copyWith(fontSize: 16.sp),
          ),
          const Spacer(),
          SvgPicture.asset(
            Svgs.icRightArrow,
            width: 12.w,
            height: 12.w,
          ),
        ],
      ),
    );
  }
}
