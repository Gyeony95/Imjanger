import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imjanger/resources/colors.dart';
import 'package:imjanger/resources/resources.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/screens/home/home_view_model.dart';

enum HomeTap {
  map('지도', Svgs.icHomeMap, 0),
  list('목록', Svgs.icHomeList, 1),
  my('MY', Svgs.icHomeMy, 2);

  final String title;
  final String iconPath;
  final int code;

  const HomeTap(this.title, this.iconPath, this.code);
}

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNav(context),
      body: findSelector<Widget>(
          context, (vm) => vm.bottomItems[vm.currentHomeTap.code]),
    );
  }

  Widget _bottomNav(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 64.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.gray200)),
        ),
        child: Row(
          children: [
            ...List.generate(
              HomeTap.values.length,
              (index) => _bottomNavItem(
                HomeTap.values[index],
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(HomeTap item, BuildContext context) {
    Color itemColor = AppColors.gray600;
    if (find(context).currentHomeTap == item) {
      itemColor = AppColors.main500;
    }
    return InkWell(
      onTap: () {
        find(context).onBottomItemTapped(item);
      },
      child: SizedBox(
        width: 130.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item.iconPath,
              width: 24.w,
              height: 24.w,
              color: itemColor,
            ),
            SizedBox(height: 4.w),
            Text(
              item.title,
              style: TextStyles.preW400.copyWith(color: itemColor),
            ),
          ],
        ),
      ),
    );
  }
}
