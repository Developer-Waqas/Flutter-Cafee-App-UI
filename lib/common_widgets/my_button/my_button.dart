import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  double? height;
  double? width;
  Color? color;
  String? title;
  void Function()? onTap;
   MyButton({super.key,
    this.width,
    this.height,
    this.color,
     this.title,
     required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: color,
        ),
        child: Center(
          child: Text(title.toString(),
          style: headingStyle7,
          ),
        ),
      ),
    );
  }
}
