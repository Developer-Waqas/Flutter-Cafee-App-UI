
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets/my_button/my_button.dart';
import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {

  ///data sharing variable===============
  String email = '';
  String name = '';


  ///initstate function==============
  @override
  void initState() {
    super.initState();
    loadData();
  }

  ///data shifting function===============
  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    name = sp.getString('name') ?? '';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btnTextColor,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),

            ///badge of shopping cart=======================
            child: Badge(
              backgroundColor: textFieldHeadingColor,
              label: const Text('3'),

              ///shopping cart icon================
              child: const Icon(CupertinoIcons.shopping_cart),
            ),
          ),
        ],

        ///logo image====================
        title: const Image(
          height: 40,
          image: AssetImage(
            'assets/images/img_logo_image.png',
          ),
        ),
        centerTitle: true,
      ),

      ///scaffold background color============
      backgroundColor: btnTextColor,

      ///Scaffold body===================
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Profile',
              style: headingStyle2,
              textAlign: TextAlign.start,
            ),
          ),
          Center(
            child: Container(
              height: 194,
              width: 384,
              decoration: BoxDecoration(
                color: textFieldHeadingColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: greyColor,
                      blurRadius: 2,
                      offset: const Offset(3.0, 3.0)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ///bonus container=============
                    Text(
                      name.toString(),
                      style: TextStyle(
                          fontFamily: 'Poppins Bold',
                          fontSize: 16,
                          color: white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Order 2 bags of coffee and get bonus stars!',
                      style: TextStyle(
                          fontFamily: 'Poppins SemiBold',
                          fontSize: 12,
                          color: white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Order any of our coffee and get an\nadditional 30 Stars! Now that’s how you\nget free coffee!',
                      style: TextStyle(
                          fontFamily: 'Poppins Regular',
                          fontSize: 12,
                          color: white),
                    ),
                    ///shop now button===============
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MyButton(
                          onTap: () {},
                          title: 'Shop now',
                          height: 30,
                          width: 90,
                          color: btnColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
