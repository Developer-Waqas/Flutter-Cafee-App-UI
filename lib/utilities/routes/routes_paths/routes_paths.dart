
import 'package:cafee_app/screens/main_screen/main_screen.dart';
import 'package:cafee_app/screens/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';

import '../../../screens/registor_screen/registor_screen.dart';
import '../../../screens/splash_screen/splash_screen.dart';
import '../routes_name/routes_name.dart';

class RoutesPaths {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.registorScreen:
        return MaterialPageRoute(builder: (context) => const RegistorScreen());
      case RoutesName.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case RoutesName.mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (context)=> const Scaffold(
            body: Center(
              child: Text(
                'Error',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ));
    }
  }
}