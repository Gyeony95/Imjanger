import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imjanger/resource/styles.dart';
import 'package:imjanger/screens/base/base_screen.dart';
import 'package:imjanger/screens/login/login_view_model.dart';

class LoginScreen extends BaseScreen<LoginViewModel> {
  const LoginScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '로그인',
          style: TextStyles.preW700,
        ),
      ),
    );
  }
}
