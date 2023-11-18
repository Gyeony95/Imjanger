

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imjanger/enviroment.dart';

void main() async {
  // Flutter Engine 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Environment(BuildType.development).run();
  });
}
