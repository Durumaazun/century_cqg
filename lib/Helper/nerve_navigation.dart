import 'package:flutter/material.dart';
import 'package:century_cqg/Screens/Dashboard/ui/home_page.dart';
import 'package:century_cqg/Screens/Login/ui/login_page.dart';

class NerveScreensNames {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String settings = '/settings';
}

class NerveNavigator {
  static final appRoutes = <String, WidgetBuilder>{
    NerveScreensNames.login: (BuildContext context) => const LoginMain(),
    NerveScreensNames.dashboard:
        (BuildContext context) => const MobileHomePage(),
  };
  static pushNamedAndRemoveUntil({
    required BuildContext context,
    required String newRouteName,
    Object? arguments,
  }) async {
    return await Navigator.of(context).pushNamedAndRemoveUntil(newRouteName, (
      route,
    ) {
      return true;
    }, arguments: arguments);
  }

  static void pop({required BuildContext context, dynamic popArguments}) {
    Navigator.of(context).pop(popArguments);
  }
}
