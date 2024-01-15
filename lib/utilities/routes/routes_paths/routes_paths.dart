
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