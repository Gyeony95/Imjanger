

import 'package:go_router/go_router.dart';
import 'package:imjanger/resource/routes/routes.dart';
import 'package:imjanger/screens/splash/splash_screen.dart';

abstract class AppPages {
  AppPages._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),
      // GoRouteWithBinding(
      //   path: Routes.login,
      //   binding: ContentPreferencesBinding(),
      //   newBuilder: (_, __) => const ContentPreferencesScreen(),
      //   prevPath: [],
      // ),

    ],
  );
}
