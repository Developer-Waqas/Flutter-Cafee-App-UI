import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/app_color/app_color.dart';

class ScanPayScreen extends StatefulWidget {
  const ScanPayScreen({super.key});

  @override
  State<ScanPayScreen> createState() => _ScanPayScreenState();
}

class _ScanPayScreenState extends State<ScanPayScreen> {
  ///data sharing variable===============
  String email = '';
  String name = '';

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
      ///scaffold background color============
      backgroundColor: btnTextColor,

      ///Scaffold body===================
      body: Column(

        children: [

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Scan & Pay',style: headingStyle2,),
                Text('Pay the amount and get rewards of 1300 stars!',style: headingStyle3,),
                const SizedBox(height: 5,),
              ],
            ),
          ),


          Center(
            ///scan container===========================
            child: Container(
              height: 548,
              width: 341,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/img_scan_pay.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
