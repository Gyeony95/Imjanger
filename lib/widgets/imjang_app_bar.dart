import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imjanger/resources/colors.dart';
import 'package:imjanger/resources/resources.dart';
import 'package:imjanger/resources/space.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/widgets/tap_well.dart';

class ImJangAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTapArrow; // 이게 있으면 화살표 있는거임

  bool get useArrow => onTapArrow != null;

  const ImJangAppBar({Key? key, required this.title, this.onTapArrow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 56.w,
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        children: [
          Space.appSpace16,
          if (useArrow) ...[
            TapWell(
              onTap: onTapArrow,
              child: SvgPicture.asset(
                Svgs.icLeftArrow,
                width: 24.w,
                height: 24.w,
              ),
            ),
            Space.appSpace8,
          ],
          Text(
            title,
            style: TextStyles.preW600.copyWith(
              fontSize: 24.sp,
            ),
          )
        ],
      ),
    );
  }
}
