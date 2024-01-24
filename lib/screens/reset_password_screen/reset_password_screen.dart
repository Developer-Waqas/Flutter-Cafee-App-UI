import 'package:cafee_app/common_widgets/my_button/my_button.dart';
import 'package:cafee_app/utilities/routes/routes_name/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/my_button/my_button2.dart';
import '../../common_widgets/textfield/textfield.dart';
import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';
import '../loading_screen/loading_screen.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({
    super.key,
  });

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {

  ///Controller===================================================================
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  ///reset form function===============================
  _resetForm() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        _isLoading = false;
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.signInScreen, (route) => false);
      });
    }
  }

  ///variables======================
  var height, width;
  bool value = false;

  ///password validate===================================
  RegExp passValid = RegExp(r"^(?=.*\d)[A-Za-z0-9-]+$");

  bool validatePassword(String msg) {
    String password = msg.trim();

    if (passValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  ///hide Password==============================
  bool isHidden = true;

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  ///hide Confirm Password=========================
  bool _isHidden = true;

  void togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  ///loading screen===========================
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {

    ///variable declaration============================
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    ///loading page===========================
    return _isLoading
        ? const LoadingScreen()
        : Scaffold(
      ///Scaffold body=======================
            body: Container(
              height: height,
              width: width,
              color: bgColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.bottomCenter,
                              scale: 5,
                              image: AssetImage(
                                'assets/images/img_logo_image.png',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.85,
                          width: width,
                          decoration: BoxDecoration(
                            color: bgColor2,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                ///reset password=======================
                                Text(
                                  'Reset Password',
                                  style: headingStyle2,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Enter your new password and enjoy coffee with your friends',
                                  style: headingStyle3,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      ///password field===============
                                      Text(
                                        'Password',
                                        style: headingStyle4,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomTextField(
                                        controller: passwordController,
                                        hintText: 'Password',
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: InkWell(
                                            onTap: _togglePasswordView,
                                            child: Icon(
                                              isHidden
                                                  ? CupertinoIcons.eye
                                                  : CupertinoIcons.eye_slash,
                                            ),
                                          ),
                                        ),
                                        obscureText: isHidden,
                                        onValidate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Password';
                                          } else if (value.length < 3) {
                                            return 'Password should contain 6 characters';
                                          } else if (value.length > 20) {
                                            return 'Password should less than 15 characters';
                                          } else {
                                            bool result =
                                                validatePassword(value);
                                            if (result) {
                                              return null;
                                            } else {
                                              return 'Password should contain atleast One Number';
                                            }
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      ///Confirm password field===============
                                      Text(
                                        'Confirm Password',
                                        style: headingStyle4,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomTextField(
                                        controller: confirmPasswordController,
                                        hintText: 'Confirm Password',
                                        suffixIcon: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: InkWell(
                                            onTap: togglePasswordView,
                                            child: Icon(
                                              _isHidden
                                                  ? CupertinoIcons.eye
                                                  : CupertinoIcons.eye_slash,
                                            ),
                                          ),
                                        ),
                                        obscureText: _isHidden,
                                        onValidate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Confirm Password';
                                          } else if (value.length < 3) {
                                            return 'Confirm Password should contain 6 characters';
                                          } else if (value.length > 20) {
                                            return 'Confirm Password should less than 15 characters';
                                          } else if(passwordController.text != confirmPasswordController.text){
                                            return 'Password does\'t match';
                                          }

                                          else {
                                            bool result =
                                                validatePassword(value);
                                            if (result) {
                                              return null;
                                            } else {
                                              return 'Confirm Password should contain atleast One Number';
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                const SizedBox(
                                  height: 20,
                                ),

                                ///SignUp Button===============
                                MyButton(
                                  title: 'Processed',
                                  width: MediaQuery.of(context).size.width,
                                  height: 66,
                                  color: btnColor,
                                  onTap: _resetForm,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
