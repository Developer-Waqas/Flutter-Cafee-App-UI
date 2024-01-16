import 'package:cafee_app/common_widgets/my_button/my_button.dart';
import 'package:cafee_app/utilities/routes/routes_name/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/my_button/my_button2.dart';
import '../../common_widgets/textfield/textfield.dart';
import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';
import '../loading_screen/loading_screen.dart';

class RegistorScreen extends StatefulWidget {
  const RegistorScreen({
    super.key,
  });

  @override
  State<RegistorScreen> createState() => _RegistorScreenState();
}

class _RegistorScreenState extends State<RegistorScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _signInForm() async {
    if(formKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        _isLoading = false;
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.mainScreen, (route) => false);
      });

    }
  }


  var height, width;
  bool value = false;

  ///email=======

  String? validateEmail (value) {
    RegExp emailValid = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1-3}\.[0-9]{1-3}\.[0-9]{1-3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    );
    if (!emailValid.hasMatch(value)){
      return 'Please enter valid Email';
    }
    return null;
  }


  ///password======
  RegExp passValid = RegExp(r"^(?=.*\d)[A-Za-z0-9-]+$");

  bool validatePassword (String msg){
    String password = msg.trim();

    if(passValid.hasMatch(password)){
      return true;
    }
    else{
      return false;
    }
  }



  ///hide Password
  bool isHidden = true;

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

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
                          height: height * 0.95,
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
                                  'Sign Up',
                                  style: headingStyle2,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'We are so excited you’re ready to \nbecome apart of our coffee network! \ndon’t forget  check out your perks!',
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
                                      Text(
                                        'Name',
                                        style: headingStyle4,
                                      ),

                                 SizedBox(
                                  height: 5,
                                ),
                                CustomTextField(
                                  controller: nameController,
                                  hintText: 'Type Name',
                                  onValidate: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter name';
                                    }
                                    else if(value.length <3) {
                                      return 'Name should be contain 3 characters';
                                    }
                                    else if(value.length >20){
                                      return 'Name should be less than 20 characters';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

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
                                  hintText: 'Type Email',
                                  onValidate: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter name';
                                    }
                                    else if(value.length <3) {
                                      return 'Name should be contain 3 characters';
                                    }
                                    else if(value.length >20){
                                      return 'Name should be less than 20 characters';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

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
                                  hintText: 'Type Password',
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
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
                                  onValidate: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter Password';
                                    }
                                    else if(value.length <3) {
                                      return 'Name should contain 6 characters';
                                    }
                                    else if(value.length >20){
                                      return 'Name should less than 15 characters';
                                    }
                                    else {
                                      bool result = validatePassword(value);
                                      if(result){
                                        return null;
                                      }
                                      else {
                                        return 'Password should contain atleast One Number';
                                      }
                                    }
                                  },
                                ),
                                    ],
                                  ),
                          ),
                                Row(
                                  children: [
                                    Checkbox(
                                        activeColor: btnColor,
                                        value: value,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.value = value!;
                                          });
                                        }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ' Get updates of new foods & drinks ',
                                      style: headingStyle3,
                                    ), //Text
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                ///SignUp Button===============
                                MyButton(
                                  title: 'SignUp',
                                  width: MediaQuery.of(context).size.width,
                                  height: 66,
                                  color: btnColor,
                                  onTap: _signInForm,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 33),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Already have an Account?',
                                        style: headingStyle3,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      MyButton2(
                                        onTap: () {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              RoutesName.signInScreen,
                                              (route) => false);
                                        },
                                        title: 'SignIn',
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        height: 32,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color: white,
                                          border: Border.all(color: black),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Text(
                                                'skip',
                                                style: headingStyle1,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            const Icon(
                                              CupertinoIcons.arrow_right,
                                              size: 20,
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
