import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imjanger/resources/routes/pages.dart';
import 'package:imjanger/resources/styles/style_option.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'resources/const_data.dart';
import 'resources/styles/imjang_catch_theme.dart';

class ImjangCatchApp extends StatelessWidget {
  const ImjangCatchApp({Key? key, this.isTestMode = false}) : super(key: key);

  final bool isTestMode;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      child: ModelBinding(
        initialModel: ImjangCatchOptions(
          themeMode: ThemeMode.system,
          textScaleFactor: systemTextScaleFactorOption,
          customTextDirection: CustomTextDirection.localeBased,
          locale: null,
          timeDilation: timeDilation,
          platform: defaultTargetPlatform,
          isTestMode: isTestMode,
        ),
        child: Builder(
          builder: (context) {
            final options = ImjangCatchOptions.of(context);

            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              themeMode: options.themeMode,
              theme: ImjangCatchTheme.lightThemeData.copyWith(
                platform: options.platform,
              ),
              darkTheme: ImjangCatchTheme.darkThemeData.copyWith(
                platform: options.platform,
              ),
              locale: options.locale,
              // title: 'ImjangCatch',
              routerConfig: AppPages.router,
              builder: (context, child) {
                return child ?? const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
