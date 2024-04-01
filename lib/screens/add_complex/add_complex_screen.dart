import 'package:flutter/material.dart';
import 'package:imjanger/screens/add_complex/add_complex_view_model.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/widgets/imjang_app_bar.dart';
import 'package:imjanger/widgets/inputs/radio_input.dart';
import 'package:imjanger/widgets/inputs/select_item.dart';

// ignore: must_be_immutable
class AddComplexScreen extends BaseScreen<AddComplexViewModel> {
  AddComplexScreen({super.key});
  late BuildContext screenContext;

  List<SelectItem> selectItems = [
    SelectItem(title: '첫번쨰', id: 1),
    SelectItem(title: '두번쨰', id: 2),
  ];

  @override
  Widget buildBody(BuildContext context) {
    screenContext = context;
    return Column(
      children: [
        ImJangAppBar(title: '새로 다녀온 단지가 있으시군요?', onTapArrow: find(screenContext).onTapBack,),
        RadioInput(selectItems: selectItems)
      ],
    );
  }


}
