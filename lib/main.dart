
import 'package:cafee_app/constants/app_color/app_color.dart';
import 'package:flutter/material.dart';

import 'utilities/routes/routes_name/routes_name.dart';

import 'utilities/routes/routes_paths/routes_paths.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: RoutesPaths.generateRoute,
    );
  }
}


