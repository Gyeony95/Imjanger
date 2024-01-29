import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imjanger/resources/colors.dart';
import 'package:imjanger/resources/resources.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/screens/home/home_view_model.dart';
import 'package:imjanger/screens/list/complex_list_main_screen.dart';
import 'package:imjanger/screens/map/map_main_screen.dart';
import 'package:imjanger/screens/my_page/my_page_main_screen.dart';
import 'package:imjanger/widgets/animated_indexed_stack.dart';
import 'package:imjanger/widgets/imjang_app_bar.dart';

class AddComplexScreen extends BaseScreen<HomeViewModel> {
  const AddComplexScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        ImJangAppBar(title: '이거나와야함')
      ],
    );
  }


}
