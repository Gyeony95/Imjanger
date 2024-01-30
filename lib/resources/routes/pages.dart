import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imjanger/resources/routes/routes.dart';
import 'package:imjanger/screens/add_complex/add_complex_screen.dart';
import 'package:imjanger/screens/home/home_screen.dart';
import 'package:imjanger/screens/login/login_screen.dart';
import 'package:imjanger/screens/splash/splash_screen.dart';

final _key = GlobalKey<NavigatorState>();

abstract class AppPages {
  AppPages._();

  static final router = GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.login,
        name: 'login',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (_, __) => const HomeScreen(),
        routes: [
          _addComplex,
        ]
      ),
    ],
  );

  static get _addComplex => GoRoute(
        path: 'addComplex',
        builder: (_, __) => AddComplexScreen(),
      );
}
