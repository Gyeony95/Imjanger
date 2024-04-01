import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imjanger/resources/colors.dart';
import 'package:imjanger/resources/resources.dart';
import 'package:imjanger/resources/space.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/widgets/inputs/select_item.dart';

class RadioInput<T> extends StatefulWidget {
  const RadioInput({
    Key? key,
    this.onSelectItem,
    required this.selectItems,
    this.initItem,
    this.isDisable = false,
    this.isRow = false,
  }) : super(key: key);

  final ValueChanged<SelectItem?>? onSelectItem;
  final List<SelectItem> selectItems;
  final T? initItem;
  final bool isDisable;
  final bool isRow;

  @override
  State<RadioInput> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  late SelectItem? selectItem;
  List<bool> isHovers = [];

  @override
  void initState() {
    super.initState();
    final initItem = widget.initItem;

    if (initItem != null) {
      int index = widget.selectItems
          .indexWhere((e) => e.id == widget.initItem.toString());
      if (index >= 0) {
        selectItem = widget.selectItems[index];
      } else {
        selectItem = widget.selectItems[0];
      }
    } else {
      selectItem = null;
    }

    for (var _ in widget.selectItems) {
      isHovers.add(false);
    }
  }

  @override
  void didUpdateWidget(RadioInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initItem == null) {
      selectItem = null;
      isHovers.clear();
      for (var _ in widget.selectItems) {
        isHovers.add(false);
      }

      return;
    }

    final code = oldWidget.initItem.hashCode;
    final newCode = widget.initItem.hashCode;

    if (code == newCode) return;

    final initItem = widget.initItem;
    if (initItem != null) {
      int index = widget.selectItems
          .indexWhere((e) => e.id == widget.initItem.toString());
      if (index >= 0) {
        selectItem = widget.selectItems[index];
      } else {
        selectItem = widget.selectItems[0];
      }
    } else {
      selectItem = null;
    }

    isHovers.clear();
    for (var _ in widget.selectItems) {
      isHovers.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isRow ? _row() : _column();
  }

  Widget _column() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          widget.selectItems.length,
              (index) => _radioItem(index),
        ),
      ],
    );
  }

  Widget _row() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          widget.selectItems.length,
              (index) => _radioItem(index),
        ),
      ],
    );
  }

  Widget _radioItem(int index) {
    var value = widget.selectItems[index];
    bool isSelect = value.id == selectItem?.id;
    return _uiCircle(value, index, isSelect);
  }

  Widget _uiCircle(SelectItem value, int index, bool isSelect) {
    return InkWell(
      onTap: () {
        if (widget.isDisable) return;
        onSelectItem(value);
      },
      onHover: (hover) {
        isHovers[index] = hover;
        setState(() {});
      },
      child: SizedBox(
        height: 46.w,
        child: Row(
          children: [
            IgnorePointer(child: radioBtn(isSelect, isHovers[index])),
            Space.appSpace12,
            Text(
              value.title,
              style: TextStyles.preW500.copyWith(
                color: isSelect ? Theme.of(context).primaryColor : AppColors.gray900,
                fontSize: TextStyles.textBase,
              ),
            ),
            Space.appSpace8
          ],
        ),
      ),
    );
  }

  Widget radioBtn(bool isSelect, bool isHover) {
    if(isSelect == false){
      return Container(
        width: 24.w,
        height: 24.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.gray700, width: 1.w),
          color: AppColors.white,
        ),
      );
    }
    return Container(
      width: 24.w,
      height: 24.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: SvgPicture.asset(
        Svgs.icCheck,
        width: 16.w,
        height: 16.w,
        color: AppColors.white,
      ),
    );
  }

  void onSelectItem(SelectItem item) {
    selectItem = item;

    final onSelect = widget.onSelectItem;
    if (onSelect != null) onSelect(selectItem);

    setState(() {});
  }
}