import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pick_up/prefs/shared_pref_controller.dart';
import 'package:pick_up/screens/auth_screen/login_screen.dart';
import 'package:pick_up/screens/main_screens/bn_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),() {
      bool isLoggedIn=SharedPrefController().getValueFor(key: prefKeys.loggedIn.name)??false;
      if(isLoggedIn){
        SharedPrefController().getValueFor(key: prefKeys.userComplete.name)? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavigationBarScreen(),)):Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/pickUpIcon.png',
              width: 164.w,
              height: 146.h,
            ),
          ),
        ],
      ),
    );
  }
}
