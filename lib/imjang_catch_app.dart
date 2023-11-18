import 'package:flutter/material.dart';
import 'package:imjanger/resource/routes/pages.dart';

class ImjangCatchApp extends StatelessWidget {
  const ImjangCatchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ImjangCatch',
      routerConfig: AppPages.router,
      builder: (context, child) {
        return child ?? const SizedBox();
      },
    );
  }
}
