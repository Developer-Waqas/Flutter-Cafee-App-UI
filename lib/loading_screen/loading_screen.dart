import 'package:cafee_app/constants/app_color/app_color.dart';
import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpinKitSpinningCircle(
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/img_bg_image.png',
                      ),
                    ),
                  ),
                );
              },
              size: 70,
            ),
            Text(
              'Loading...',
              style: headingStyle3,
            ),
          ],
        ),
      ),
    );
  }
}
