import 'package:cafee_app/common_widgets/my_button/my_button.dart';
import 'package:cafee_app/utilities/routes/routes_name/routes_name.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/my_button/my_button2.dart';
import '../../common_widgets/textfield/textfield.dart';
import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';
import '../loading_screen/loading_screen.dart';

class ForgotSreen extends StatefulWidget {
  const ForgotSreen({
    super.key,
  });

  @override
  State<ForgotSreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotSreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _forgotForm() async {
    if(formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        _isLoading = false;
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.pinCodeScreen2, (route) => false);
      });

    }
  }


  var height, width;
  bool value = false;

  ///email=======

  String? validateEmail (value) {
    RegExp emailValid = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    );
    if (!emailValid.hasMatch(value)){
      return 'Please enter valid Email';
    }
    return null;
  }

 ///for loading page============

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return _isLoading
        ? const LoadingScreen()
        : Scaffold(
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
                          Text(
                            'Forgot Password?',
                            style: headingStyle2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Don\'t worry, Enter your email & reset your password!',
                            style: headingStyle3,
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          ///name field==============
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///email field=============
                                Text(
                                  'Email',
                                  style: headingStyle4,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  onValidate: validateEmail,
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                          ///SignUp Button===============
                          MyButton(
                            title: 'Next',
                            width: MediaQuery.of(context).size.width,
                            height: 66,
                            color: btnColor,
                            onTap: _forgotForm,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                              ],
                            ),
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

