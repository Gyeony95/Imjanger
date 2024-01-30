import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imjanger/resources/colors.dart';
import 'package:imjanger/resources/resources.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/widgets/inputs/select_item.dart';

enum RadioUiType {
  circle(),
  square();

  const RadioUiType();
}

class RadioInput<T> extends StatefulWidget {
  const RadioInput({
    Key? key,
    this.onSelectItem,
    required this.selectItems,
    this.initItem,
    this.isDisable = false,
    this.isRow = false,
    this.uiType = RadioUiType.circle,
  }) : super(key: key);

  final ValueChanged<SelectItem?>? onSelectItem;
  final List<SelectItem> selectItems;
  final T? initItem;
  final bool isDisable;
  final bool isRow;
  final RadioUiType uiType;

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

    switch (widget.uiType) {
      case RadioUiType.circle:
        return _uiCircle(value, index, isSelect);
      case RadioUiType.square:
        return _uiSquare(value, index, isSelect);
      default:
        return _uiCircle(value, index, isSelect);
    }
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
        height: 32,
        child: Row(
          children: [
            IgnorePointer(child: radioBtn(isSelect, isHovers[index])),
            const SizedBox(width: 4),
            Text(
              value.title,
              style: TextStyles.preW400.copyWith(
                color: AppColors.gray600,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _uiSquare(SelectItem value, int index, bool isSelect) {
    Color fontColor = AppColors.gray600;
    Color borderColor = AppColors.gray300;
    double lastBorder = 0;

    if (widget.selectItems.length == index) {
      lastBorder = 1;
    }

    if (isSelect) {
      fontColor = AppColors.main500;
      borderColor = AppColors.main500;
      lastBorder = 1;
    }

    return InkWell(
      onTap: () {
        if (widget.isDisable) return;
        onSelectItem(value);
      },
      child: Container(
        height: 38,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(width: 1, color: borderColor),
            bottom: BorderSide(width: 1, color: borderColor),
            left: BorderSide(width: 1, color: borderColor),
            right: BorderSide(width: lastBorder, color: borderColor),
          ),
        ),
        child: Text(
          value.title,
          textAlign: TextAlign.center,
          style: TextStyles.preW400.copyWith(
            color: fontColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget radioBtn(bool isSelect, bool isHover) {
    return SvgPicture.asset(
      isSelect ? Svgs.icRadioChecked : Svgs.icRadioUncheck, width: 24.w,
      height: 24.w,
      color: isSelect ? AppColors.main500 : AppColors.gray900,
    );
  }

  void onSelectItem(SelectItem item) {
    selectItem = item;

    final onSelect = widget.onSelectItem;
    if (onSelect != null) onSelect(selectItem);

    setState(() {});
  }
}