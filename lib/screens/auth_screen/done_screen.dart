import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/screens/main_screens/bn_screen.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: SizedBox(
              height:519.h,
              child: Stack(
                children: [
                  Container(
                    height: 519.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/Shape.png'))
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 49.h,),
                        Image.asset(
                          'images/logo2.png',
                          width: 112.w,
                          height: 82.07.h,
                        ),
                        SizedBox(height: 40.h,),
                        Text(
                          'Order Number:',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8.h,),
                        Text(
                          '365148',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Text(
                          'Mohammed Ali',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          '+9667829446318',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          'moh23@gmail.com',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 62.h,),
          InkWell(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BNScreenScreen(),)),
            child: Container(
              width: 244.w,
              height: 102.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/thanks.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
