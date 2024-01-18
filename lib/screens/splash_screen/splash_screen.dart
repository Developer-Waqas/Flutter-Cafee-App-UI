import 'dart:async';
import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/routes/routes_name/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();

    isSignUp();
  }

  void isSignUp() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isSignUp = sp.getBool('isSignUp') ?? false;
    bool isLogin = sp.getBool('isLogin') ?? false;


    if(isSignUp){
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.mainScreen, (route) => false);
      });
    } else if(isLogin){
      Timer(const Duration(seconds: 3), ()
      {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.mainScreen, (route) => false);
      });
    }

    else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.registorScreen, (route) => false);
      });
    }
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
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Waqas Cafee',style: headingStyle8,),
            ),
          ],
        ),
      ),
    );
  }
}
