import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imjanger/resources/routes/pages.dart';

class ImjangCatchApp extends StatelessWidget {
  const ImjangCatchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // iphone 12 pro 개발 기준 해상도
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ImjangCatch',
        routerConfig: AppPages.router,
        builder: (context, child) {
          return child ?? const SizedBox();
        },
      ),
    );
  }
}
