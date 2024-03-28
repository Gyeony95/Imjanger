import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imjanger/di/get_it_injector.dart';
import 'package:imjanger/enviroment.dart';
import 'package:imjanger/firebase_options_dev.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // await Firebase.initializeApp(
  //   name: dotenv.env['FIREBASE_KEY_DEV'],
  //   options: DevFirebaseOptions.currentPlatform,
  // );
  await Firebase.initializeApp(options: DevFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // 종속성 주입
    GetItInjector().setUp();
    Environment(BuildType.development).run();
  });
}
