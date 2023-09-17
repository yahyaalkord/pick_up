import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/model/store_subscriptio_model.dart';
import 'package:pick_up/prefs/shared_pref_controller.dart';
import 'package:pick_up/screens/main_screens/bn_screen.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({Key? key,required this.subscription}) : super(key: key);
final StoreSubscriptionModel subscription;
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
                          widget.subscription.orderId.toString(),
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Text(
                          widget.subscription.name??'',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          widget.subscription.phone??'',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          SharedPrefController().getValueFor(key: prefKeys.email.name),
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
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(),)),
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
