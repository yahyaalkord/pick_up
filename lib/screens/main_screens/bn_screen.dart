

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/screens/main_screens/bn_screens/exercises_screen.dart';
import 'package:pick_up/screens/main_screens/bn_screens/healthy_food_screen.dart';
import 'package:pick_up/screens/main_screens/bn_screens/home_screen.dart';
import 'package:pick_up/screens/main_screens/bn_screens/trainers_screen.dart';

import '../../utils/bn_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: 'Home', widget: HomeScreen()),
    const BnScreen(title: 'Trainers', widget: TrainersScreen()),
    const BnScreen(title: 'Exercises', widget: ExercisesScreen()),
    const BnScreen(title: 'Healthy food', widget: HealthyFoodScreen()),
  ];
  /*final screens = [
    ReportsScreen(),
    ProfileScreen(),
  ];*/
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      backgroundColor: const Color(0XFFFFFFFF),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
          shadowColor: const Color(0x3FC4C4C4),
        ),
        child: PhysicalModel(
          color: Colors.transparent,
          elevation: 20,
          shadowColor: const Color(0x3FC4C4C4),
          child: CurvedNavigationBar(
            height: 60.h,
            index: _currentIndex,
            color: Colors.white,
            animationCurve: Curves.easeInCirc,
            animationDuration: const Duration(milliseconds: 400),
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            items: <Widget>[
              _currentIndex==0?SizedBox(height:50.h,width:50.w,child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.h),
                child: SvgPicture.asset('images/home2.svg',height: 40.h,width: 40.w,),
              )):SvgPicture.asset('images/home1.svg',height: 30.h,width: 30.w,),
              _currentIndex==1?SizedBox(height:50.h,width:50.w,
                  child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.h),
                child: SvgPicture.asset('images/open-arm-fill1.svg',height: 40.h,width: 40.w,),
              )):SvgPicture.asset('images/open-arm-fill.svg',height: 30.h,width: 30.w,),
              _currentIndex==2?SizedBox(
                  height:50.h,width:50.w,
                  child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.h),
                child: SvgPicture.asset('images/run-fill1.svg',height: 40.h,width: 40.w,),
              )):SvgPicture.asset('images/run-fill.svg',height: 30.h,width: 30.w,),
              _currentIndex==3?SizedBox(
                  height:50.h,width:50.w,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.h),
                    child: SvgPicture.asset('images/restaurant-2-line1.svg',height: 40.h,width: 40.w,),
                  )):SvgPicture.asset('images/restaurant-2-line.svg',height: 30.h,width: 30.w,),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 40.h,),
          Container(
            width: 64.w,
            height: 56.95.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/pickUpIcon.png"),
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Text(
            _screens[_currentIndex].title,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              color: const Color(0xFF242D68),
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          _screens[_currentIndex].widget,
          SizedBox(height: 50.h,)
        ],
      ),
    );
  }
}