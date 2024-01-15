import 'package:cafee_app/common_widgets/my_button/my_button.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/textfield/textfield.dart';
import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';

class RegistorScreen extends StatefulWidget {
  const RegistorScreen({
    super.key,
  });

  @override
  State<RegistorScreen> createState() => _RegistorScreenState();
}

class _RegistorScreenState extends State<RegistorScreen> {
  var height, width;
  bool value = false;

  ///hide Password
  bool isHidden = true;

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                    height: height * 0.18,
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
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'skip',
                              style: headingStyle1,
                            ),
                          ],
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
                            'SignUp',
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
                          Text(
                            'Name',
                            style: headingStyle4,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            hintText: 'Enter Name',
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
                            hintText: 'Enter Email',
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
                            hintText: 'Enter Password',
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: _togglePasswordView,
                                child: Icon(
                                  isHidden
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            obscureText: isHidden,
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
                              Text(' Want update of new foods & drinks ',
                                  style: headingStyle3), //Text
                            ],
                          ),
                          const SizedBox(height: 10,),
                          MyButton(
                            title: 'SignUp',
                            width: MediaQuery.of(context).size.width,
                            height: 66,
                            color: btnColor,
                            onTap: (){},
                          )
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
