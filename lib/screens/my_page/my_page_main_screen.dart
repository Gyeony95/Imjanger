import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  late BuildContext screenContext;

  @override
  Widget buildBody(BuildContext context) {
    screenContext = context;
    return Column(
      children: [
        const ImJangAppBar(title: '마이페이지'),
        _profileBox(),
        _menuList(),
      ],
    );
  }

  Widget _profileBox() {
    return Container(
      // height: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.gray200, width: 1))),
      child: Column(
        children: [
          Space.appSpace24,
          Row(
            children: [
              _profileImage(),
              Space.appSpace8,
              Text(
                '떡상기원1일차',
                style: TextStyles.preW700.copyWith(
                  fontSize: TextStyles.textLg,
                  color: AppColors.gray900,
                ),
              ),
            ],
          ),
          Space.appSpace32,
          _editProfileButton(),
          Space.appSpace24,
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

  Widget _editProfileButton() {
    return Container(
      height: 38.w,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border:
            Border.all(color: Theme.of(screenContext).primaryColor, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Svgs.icPencilAlt, width: 20.w, height: 20.w),
          Space.appSpace8,
          Text(
            '프로필 편집',
            style: TextStyles.preW500.copyWith(
              color: Theme.of(screenContext).primaryColor,
              fontSize: TextStyles.textBase,
            ),
          ),
        ],
      ),
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
      child: Row(
        children: [
          Text(
            type.title,
            style: TextStyles.preW500.copyWith(
              fontSize: TextStyles.textBase,
              color: AppColors.gray900,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            Svgs.icCheveronRight,
            width: 16.w,
            height: 16.w,
          ),
        ],
      ),
    );
  }
}
