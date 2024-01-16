
import 'package:flutter/material.dart';

import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';

class CustomTextField extends StatelessWidget {

  final String? hintText;
  TextEditingController? controller;
  Widget? suffixIcon;
  bool obscureText ;
  String? Function(String?)? onValidate;

  CustomTextField({super.key,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.obscureText=false,
    this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextFormField(
        cursorColor: hintTextColor,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.name,
        style: headingStyle6,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorStyle: errorTextStyle,
            hintText: hintText,
            hintStyle: headingStyle5,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(color: black)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            fillColor: white,
          filled: true,
          suffixIcon: suffixIcon,
        ),
        validator: onValidate,
      ),
    );
  }
}


