import 'package:flutter/material.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/screens/home/home_view_model.dart';
import 'package:imjanger/widgets/imjang_app_bar.dart';
import 'package:imjanger/widgets/inputs/radio_input.dart';
import 'package:imjanger/widgets/inputs/select_item.dart';

class AddComplexScreen extends BaseScreen<HomeViewModel> {
  AddComplexScreen({super.key});

  List<SelectItem> selectItems = [
    SelectItem(title: '첫번쨰', id: 1),
    SelectItem(title: '두번쨰', id: 2),
  ];

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        ImJangAppBar(title: '이거나와야함'),
        RadioInput(selectItems: selectItems)
      ],
    );
  }


}
