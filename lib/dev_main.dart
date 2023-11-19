

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imjanger/di/get_it_injector.dart';
import 'package:imjanger/enviroment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // 종속성 주입
    GetItInjector().setUp();
    Environment(BuildType.development).run();
  });
}
