import 'dart:async';
import 'package:flutter/material.dart';

import '../../utilities/routes/routes_name/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {

      Navigator.pushNamed(context, RoutesName.registorScreen);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/img_bg_image.png'),),
      ),
    );
  }
}
