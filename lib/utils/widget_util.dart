import 'package:flutter/material.dart';

extension WidgetExtension on Widget{
  SliverToBoxAdapter get sv => SliverToBoxAdapter(child: this);
}