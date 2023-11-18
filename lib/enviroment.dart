import 'package:flutter/material.dart';
import 'package:imjanger/imjang_catch_app.dart';

enum BuildType {
  development,
  production,
}

class Environment {
  static Environment? _instance;

  factory Environment(BuildType buildType) =>
      _instance ??= Environment._internal(buildType);

  const Environment._internal(this._buildType);

  final BuildType _buildType;

  static BuildType get buildType => _instance!._buildType;

  void run() {
    runApp(const ImjangCatchApp());
  }
}