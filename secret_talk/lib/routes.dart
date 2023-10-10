


import 'package:flutter/material.dart';
import 'package:secret_talk/core/fade_page_route.dart';
import 'package:secret_talk/ui/screen/home/home.dart';
import 'package:secret_talk/ui/screen/login/login.dart';

enum Routes {
  home
}

class _Paths {
  static const String home = 'home';

  static const Map<Routes, String> _pathMap = {
    Routes.home: _Paths.home,
  };

  static String of(Routes route) => _pathMap[route] ?? home;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {

    print("generate Route settings name ${settings.name}");
    
    switch (settings.name) {
      case _Paths.home:
        return FadeRoute(page: const HomeScreen());
      default:
        return FadeRoute(page: const LoginScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}