import 'package:cafee_app/constants/app_style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/app_color/app_color.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ///data sharing variable===============
  String name = '';

  ///init state function==============
  @override
  void initState() {
    super.initState();
    loadData();
  }

  ///switch button==============
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;


  ///data shifting function===============
  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('name') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: btnTextColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ///account==========
                  const Text(
                    'Account',
                    style: TextStyle(
                      fontFamily: 'Poppins Bold',
                      fontSize: 28,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/img_profile.png'),
                      ),
                    ),
                  ),
                ],
              ),

              ///welcome==============
              Row(
                children: [
                  Text(
                    'Welcome',
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
              const SizedBox(
                height: 10,
              ),
              const Divider(),
        
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [

                        ///profile===============
                        Text('Profile',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins Bold',
                              color: black
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                   ///Profile Lists==============
                   ListTile(
                    title: const Text('Personal Info'),
                    trailing: const Icon(CupertinoIcons.info),
                    onTap: (){},
                  ),

                  const ListTile(
                    title: Text('Cards & Payments'),
                    trailing: Icon(CupertinoIcons.creditcard),
                  ),
                  const ListTile(
                    title: Text('Transaction History'),
                    trailing: Icon(Icons.checklist_sharp),
                  ),

                  const ListTile(
                    title: Text('Privacy & Data'),
                    trailing: Icon(CupertinoIcons.hand_raised_fill),
                  ),
                  const ListTile(
                    title: Text('Account ID'),
                    trailing: Icon(CupertinoIcons.person_crop_rectangle),
                  ),
                ],
              ),
              const Divider(),
        
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///security====================
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Text('Security',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins Bold',
                              color: black
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                  ///security lists=====================
                  ListTile(
                    title: const Text('2 - factor authentication'),
                    trailing: Switch.adaptive(
                      activeColor: btnColor,
                        value: _value1, onChanged: (newValue){
                      setState(() {
                        _value1 = newValue;
                      });
                    })
                  ),

                  ListTile(
                      title: const Text('Face ID'),
                      trailing: Switch.adaptive(
                          activeColor: btnColor,
                          value: _value2, onChanged: (newValue){
                        setState(() {
                          _value2 = newValue;
                        });
                      })
                  ),
                  ListTile(
                      title: const Text('Passcode lock'),
                      trailing: Switch.adaptive(
                          activeColor: btnColor,
                          value: _value3, onChanged: (newValue){
                        setState(() {
                          _value3 = newValue;
                        });
                      })
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
              const Divider(),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [

                        ///Notification===================
                        Text('Notification Preferences',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins Bold',
                              color: black
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                  ///Notification Lists================
                  ListTile(
                      title: const Text('Show notifications'),
                      trailing: Switch.adaptive(
                          activeColor: btnColor,
                          value: _value4, onChanged: (newValue){
                        setState(() {
                          _value4 = newValue;
                        });
                      })
                  ),

                  ///notification lists=======================
                  ListTile(
                      title: const Text('Security Alert'),
                      trailing: Switch.adaptive(
                          activeColor: btnColor,
                          value: _value5, onChanged: (newValue){
                        setState(() {
                          _value5 = newValue;
                        });
                      })
                  ),
                  ListTile(
                      title: const Text('New Drinks'),
                      trailing: Switch.adaptive(
                          activeColor: btnColor,
                          value: _value6, onChanged: (newValue){
                        setState(() {
                          _value6 = newValue;
                        });
                      })
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
