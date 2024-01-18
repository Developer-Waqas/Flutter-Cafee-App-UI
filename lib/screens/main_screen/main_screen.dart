import 'package:cafee_app/constants/app_color/app_color.dart';
import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:cafee_app/utilities/routes/routes_name/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String firstName = '';
  String lastName = '';
  String email = '';
  String name = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    firstName = sp.getString('firstName').toString();
    lastName = sp.getString('lastName') ?? '';
    email = sp.getString('email').toString();
    name = sp.getString('name').toString();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btnTextColor,
        shadowColor: greyColor,
        actions: [
          Icon(CupertinoIcons.shopping_cart),
        ],
        title: Image(
          height: 50,
          image: AssetImage(
            'assets/images/img_logo_image.png',
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: NavigationDrawer(
          children: [

          ],
        ),
      ),
      backgroundColor: btnTextColor,
    );
  }
}
