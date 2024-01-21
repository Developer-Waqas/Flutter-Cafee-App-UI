import 'package:cafee_app/common_widgets/my_button/my_button.dart';
import 'package:cafee_app/utilities/routes/routes_name/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';
import '../../screens/loading_screen/loading_screen.dart';

class PinCodeScreen extends StatefulWidget {
  String? Function(String?)? onValidate;
    PinCodeScreen({
    super.key,
    this.onValidate,
  });

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _pinCodeForm() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        _isLoading = false;
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.mainScreen, (route) => false);
      });
    }
  }

  var height, width;
  bool value = false;

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
                                  'Verification Code',
                                  style: headingStyle2,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Please enter any four/4 digits code to verify your account',
                                  style: headingStyle3,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: PinCodeTextField(
                                          appContext: context,
                                          length: 4,
                                          keyboardType: TextInputType.number,
                                          cursorColor: hintTextColor,
                                          textStyle: TextStyle(
                                            fontFamily: 'Poppins Light',
                                            color: hintTextColor,
                                          ),
                                          pinTheme: PinTheme(
                                            borderRadius: BorderRadius.circular(12),
                                            shape: PinCodeFieldShape.box,
                                          ),
                                          validator: (value){
                                            if(value!.isEmpty){
                                              return 'Please enter PinCode first!';
                                            }
                                            else if(value.length < 4){
                                              return 'Please fill all the boxes';
                                            }
                                            else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                /// Button===============
                                Center(
                                  child: MyButton(
                                    title: 'Processed',
                                    width: MediaQuery.of(context).size.width,
                                    height: 66,
                                    color: btnColor,
                                    onTap: _pinCodeForm,
                                  ),
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
