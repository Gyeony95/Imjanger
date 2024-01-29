import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  SliverToBoxAdapter get sv => SliverToBoxAdapter(child: this);

  SafeArea safeArea({bool? top, bool? bottom, bool? left, bool? right}) => SafeArea(
    top: top ?? true,
    bottom: bottom ?? true,
    left: left ?? true,
    right: right ?? true,
    child: this,
  );
}
