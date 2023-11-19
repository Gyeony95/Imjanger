import 'package:flutter/material.dart';
import 'package:imjanger/resources/text_styles.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/screens/splash/splash_view_model.dart';

class SplashScreen extends BaseScreen<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          find(context).test,
          style: TextStyles.preW700,
        ),
      ),
    );
  }
}
