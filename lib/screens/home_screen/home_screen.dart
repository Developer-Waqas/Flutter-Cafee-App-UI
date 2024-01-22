import 'package:cafee_app/common_widgets/my_button/my_button.dart';
import 'package:cafee_app/constants/app_color/app_color.dart';
import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:cafee_app/screens/scan_pay_screen/scan_pay_screen.dart';
import 'package:cafee_app/utilities/routes/routes_name/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ///data sharing variable===============
  String email = '';
  String name = '';

  ///images List==========
  List img = [
    'img_hotcoffee',
    'img_hottea',
    'img_hotdrinks',
    'img_frapuccino',
    'img_coldcoffee',
    'img_icedtea',
    'img_colddrinks',
  ];

  List imgName = [
    'Hot Coffee',
    'Hot Tea',
    'Hot Drink',
    'Frapuccino',
    'Cold Coffee',
    'Iced Tea',
    'Cold Drink'
  ];

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Navigation Drawer===========
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ///User holder account detail========
              UserAccountsDrawerHeader(

                ///name================
                accountName: Text(
                  name.toString(),
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    color: text1Color,
                  ),
                ),

                ///email=================
                accountEmail: Text(
                  email.toString(),
                  style: TextStyle(
                    fontFamily: 'Poppins Light',
                    color: text1Color,
                  ),
                ),
                decoration: const BoxDecoration(
                    borderRadius:  BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    )),

                ///profile picture=========================
                currentAccountPicture: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img_profile.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ///Navigation drawer list===============
              ListTile(
                leading: const Icon(CupertinoIcons.person),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.star),
                title: const Text('Rewards'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text('Premium'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.signInScreen,
                        (route) => false,
                  );
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              const SizedBox(height: 20,),
              const Divider(),
            ],
          ),
        ),
      ),

      ///scaffold background color============
      backgroundColor: btnTextColor,

      ///Scaffold body===================
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  ///heading text and name of the user===========
                  Text(
                    'Good Morning!',
                    style: headingStyle9,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    name.toString(),
                    style: headingStyle9,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              ///bonus container================
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
                        'BONUS REWARDS',
                        style: TextStyle(
                            fontFamily: 'Poppins Medium',
                            fontSize: 10,
                            color: white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Coffee Delivered to your house',
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
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ///Drinks sections ========================
                  Text(
                    'Drinks',
                    style: headingStyle10,
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontFamily: 'Poppins Regular',
                        color: textFieldHeadingColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///Coffee types pictures================
            GridView.count(

              crossAxisCount: 3,
              childAspectRatio: 150 / 170,
              shrinkWrap: true,
              children: [
                for (int i = 0; i < img.length; i++)
                  ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/${img[i]}.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  imgName[i].toString(),
                                  style: headingStyle11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
