
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/my_button/my_button.dart';
import '../../constants/app_color/app_color.dart';
import '../../constants/app_style/app_style.dart';

class PremiumScreen2 extends StatefulWidget {
  const PremiumScreen2({super.key});

  @override
  State<PremiumScreen2> createState() => _PremiumScreen2State();
}

class _PremiumScreen2State extends State<PremiumScreen2> {

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'Intresting Offers of Premium',
                style: headingStyle2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: textFieldHeadingColor,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                          color: greyColor,
                          blurRadius: 2,
                          offset: const Offset(3.0, 3.0)),
                    ],
                  ),

                  ///weekly offer container==================
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Weekly Offer',
                          style: TextStyle(
                              fontFamily: 'Poppins SemiBold',
                              fontSize: 20,
                              color: white),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                'Unlock premium versiion for discounts in only\n',
                                style: TextStyle(
                                    fontFamily: 'Poppins Regular', color: white),
                              ),
                              TextSpan(
                                text: '50\$ per Week',
                                style: TextStyle(
                                    fontFamily: 'Poppins SemiBold', color: white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '1. Get 45% discount in \'Cold Coffee\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2. Get 53% discount in \'Hot Tea\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '3. Get 43% discount in \'Iced Tea\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4. There are many more intresting offers of\n    premium version.',
                              style: headingStyle3,
                            ),
                            const SizedBox(height: 5,),

                            ///subscribe button==================
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyButton(
                                  onTap: () {},
                                  title: 'Subscribe now',
                                  height: 30,
                                  width: 150,
                                  color: btnColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              ///monthly offer container================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: textFieldHeadingColor,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                          color: greyColor,
                          blurRadius: 2,
                          offset: const Offset(3.0, 3.0)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Monthly Offer',
                          style: TextStyle(
                              fontFamily: 'Poppins SemiBold',
                              fontSize: 20,
                              color: white),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                'Unlock premium versiion for discounts in only\n',
                                style: TextStyle(
                                    fontFamily: 'Poppins Regular', color: white),
                              ),
                              TextSpan(
                                text: '90\$ per Month',
                                style: TextStyle(
                                    fontFamily: 'Poppins SemiBold', color: white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '1. Get 75% discount in \'Cold Coffee\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2. Get 72% discount in \'Hot Tea\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '3. Get 67% discount in \'Iced Tea\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4. There are many more intresting offers of\n    premium version.',
                              style: headingStyle3,
                            ),
                            const SizedBox(height: 5,),

                            ///subscribe button===============
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyButton(
                                  onTap: () {},
                                  title: 'Subscribe now',
                                  height: 30,
                                  width: 150,
                                  color: btnColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),

              ///Year offer container==============
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: textFieldHeadingColor,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                          color: greyColor,
                          blurRadius: 2,
                          offset: const Offset(3.0, 3.0)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yearly Offer',
                          style: TextStyle(
                              fontFamily: 'Poppins SemiBold',
                              fontSize: 20,
                              color: white),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                'Unlock premium version for discounts in only\n',
                                style: TextStyle(
                                    fontFamily: 'Poppins Regular', color: white),
                              ),
                              TextSpan(
                                text: '150\$ per Year',
                                style: TextStyle(
                                    fontFamily: 'Poppins SemiBold', color: white),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '1. Get 80% discount in \'Cold Coffee\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '2. Get 90% discount in \'Hot Tea\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '3. Get 75% discount in \'Iced Tea\'.',
                              style: headingStyle3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '4. There are many more intresting offers of\n    premium version.',
                              style: headingStyle3,
                            ),
                            const SizedBox(height: 5,),

                            ///subscribe button=====================
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyButton(
                                  onTap: () {},
                                  title: 'Subscribe now',
                                  height: 30,
                                  width: 150,
                                  color: btnColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
