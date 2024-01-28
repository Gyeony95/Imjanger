// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imjanger/data/model/complex_model.dart';
import 'package:imjanger/resources/colors.dart';
import 'package:imjanger/resources/resources.dart';
import 'package:imjanger/resources/space.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/screens/list/complex_list_main_view_model.dart';
import 'package:imjanger/utils/widget_util.dart';
import 'package:imjanger/widgets/cached_image.dart';
import 'package:imjanger/widgets/imjang_app_bar.dart';

String example =
    'https://www.hapt.co.kr/news/photo/202305/158843_29118_1852.jpg';

class ComplexListMainScreen extends BaseScreen<ComplexListMainViewModel> {

  late BuildContext screenContext;

  ComplexListMainScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    screenContext = context;
    return SafeArea(
        child: Column(
      children: [
        const ImJangAppBar(title: '내가 본 단지들'),
        _scrollBody(),
      ],
    ));
  }

  Widget _scrollBody() {
    return Expanded(
      child: Container(
        color: AppColors.gray100,
        child: CustomScrollView(
          slivers: [
            Space.sliverAppSpace12,
            _gridMenuRow().sv,
            Space.sliverAppSpace16,
            _complexAddButton().sv,
            Space.sliverAppSpace16,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                '최근 등록된 단지',
                style: TextStyles.preW700.copyWith(
                  fontSize: 20.sp,
                ),
              ),
            ).sv,
            Space.sliverAppSpace8,
            _recentComplexList().sv,
          ],
        ),
      ),
    );
  }

  Widget _gridMenuRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          _gridMenuItem(0),
          Space.appSpace8,
          _gridMenuItem(1),
        ],
      ),
    );
  }

  Widget _gridMenuItem(int index) {
    bool isAdd = index == 0;
    return Container(
      width: 175.w,
      height: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isAdd ? Svgs.icFolderComplex : Svgs.icMapSearchPin,
            width: 50.w,
            height: 50.w,
          ),
          Space.appSpace8,
          Text(
            isAdd ? '폴더별' : '지역별',
            style: TextStyles.preW500
                .copyWith(fontSize: 18.sp, color: AppColors.main500),
          ),
          Text(
            '모아보기',
            style: TextStyles.preW500.copyWith(fontSize: 18.sp),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  // 단지 추가 버튼
  Widget _complexAddButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      height: 56.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.main50,
        boxShadow: [
          BoxShadow(
            color: const Color(0x19191980),
            offset: Offset(0, 2.w),
            blurRadius: 4.w,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Svgs.icAddComplex,
            width: 24.w,
            height: 24.w,
            color: AppColors.main500,
          ),
          Space.appSpace8,
          Text(
            '내 단지 추가하기',
            style: TextStyles.preW500
                .copyWith(fontSize: 16.sp, color: AppColors.main500),
          )
        ],
      ),
    );
  }

  Widget _recentComplexList() {
    var vm = find(screenContext);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: vm.recentComplexList.length,
      itemBuilder: (context, index) {
        var item = vm.recentComplexList[index];
        return _recentComplexItem(item);
      },
    );
  }

  Widget _recentComplexItem(ComplexModel item) {
    return Container(
      height: 100.w,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0x19191980),
            offset: Offset(0, 2.w),
            blurRadius: 4.w,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 242.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? '',
                  style: TextStyles.preW500.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.gray900,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Space.appSpace4,
                Text(
                  item.subTitle ?? '',
                  style: TextStyles.preW400.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.gray700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Space.appSpace8,
          CachedImage(
            url: example,
            height: 76.w,
            width: 76.w,
            borderRadius: BorderRadius.circular(16),
          ),
        ],
      ),
    );
  }
}
