import 'package:cafee_app/common_widgets/my_button/my_button.dart';
import 'package:cafee_app/constants/app_color/app_color.dart';
import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
    'img_colddrinks'
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

  @override
  void initState() {
    super.initState();
    loadData();
  }

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
        actions: [
           Padding(
            padding: EdgeInsets.only(right: 15),
            child: Badge(
              backgroundColor: textFieldHeadingColor,
                 label: Text('3'),
                child: Icon(CupertinoIcons.shopping_cart)),
          ),
        ],
        title: const Image(
          height: 40,
          image: AssetImage(
            'assets/images/img_logo_image.png',
          ),
        ),
        centerTitle: true,
        leading: Icon(CupertinoIcons.bars,size: 28,),
      ),
      backgroundColor: btnTextColor,
      bottomNavigationBar: NavigationBar(
        backgroundColor: white,
        destinations: const [
          NavigationDestination(icon: Icon(CupertinoIcons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(CupertinoIcons.qrcode_viewfinder), label: 'Scan/Pay'),
          NavigationDestination(
              icon: Icon(CupertinoIcons.star), label: 'Rewards'),
          NavigationDestination(
              icon: Icon(CupertinoIcons.person), label: 'Account'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Good Morning!',
                    style: headingStyle9,
                  ),
                  SizedBox(width: 5,),
                  Text(name.toString(),style: headingStyle9,)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        offset: Offset(3.0, 3.0)),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'BONUS REWARDS',
                        style: TextStyle(
                            fontFamily: 'Poppins Medium',
                            fontSize: 10,
                            color: white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Coffee Delivered to your house',
                        style: TextStyle(
                            fontFamily: 'Poppins Bold',
                            fontSize: 16,
                            color: white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order 2 bags of coffee and get bonus stars!',
                        style: TextStyle(
                            fontFamily: 'Poppins SemiBold',
                            fontSize: 12,
                            color: white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Order any of our coffee and get an\nadditional 30 Stars! Now that’s how you\nget free coffee!',
                        style: TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontSize: 12,
                            color: white),
                      ),
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
            SizedBox(
              height: 10,
            ),
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 150 / 195,
              shrinkWrap: true,
              children: [
                for (int i = 0; i < img.length; i++)
                  ListView(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                        decoration: BoxDecoration(
                          color: Color(0xffF9F9F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/${img[i]}.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                              ),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(imgName[i].toString(),style: headingStyle11,),
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
