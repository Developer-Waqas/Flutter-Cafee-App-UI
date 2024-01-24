import 'package:cafee_app/screens/accont_screen/account_screen.dart';
import 'package:cafee_app/screens/home_screen/home_screen.dart';
import 'package:cafee_app/screens/premium_screen/premium_screen.dart';
import 'package:cafee_app/screens/scan_pay_screen/scan_pay_screen.dart';

import 'package:cafee_app/utilities/routes/routes_name/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_color/app_color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screenList = [
    const HomeScreen(),
    const ScanPayScreen(),
    const PremiumScreen(),
    const AccountScreen(),
  ];

  ///data sharing variable===============
  String email = '';
  String name = '';
  String  gender = '';
  ///Navigation bar index===================
  int currentIndex = 0;

  ///init state function==============
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
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                  ),
                ),

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
                leading: const Icon(CupertinoIcons.profile_circled),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text('Premium'),
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.premiumScreen2);
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.star),
                title: const Text('Rewards'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutesName.signInScreen, (route) => false);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
            ],
          ),
        ),
      ),

      ///scaffold background color============
      backgroundColor: btnTextColor,

      ///bottom navigation bar===================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: btnTextColor,
        selectedItemColor: black,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        unselectedItemColor: black,
        selectedLabelStyle: const TextStyle(fontFamily: 'Poppins Regular'),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Poppins Regular',
        ),
        elevation: 2,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },

        ///bottom navigation bar list====================
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.house_fill),
            backgroundColor: white,
            icon: const Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.qrcode_viewfinder),
            backgroundColor: white,
            icon: const Icon(CupertinoIcons.qrcode),
            label: 'Scan/Pay',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.workspace_premium),
            backgroundColor: white,
            icon: const Icon(Icons.workspace_premium_rounded),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.profile_circled),
            backgroundColor: white,
            icon: const Icon(CupertinoIcons.person),
            label: 'Account',
          ),
        ],
      ),

      ///Scaffold body===================
      body: IndexedStack(
        index: currentIndex,
        children: screenList,
      ),
    );
  }
}
