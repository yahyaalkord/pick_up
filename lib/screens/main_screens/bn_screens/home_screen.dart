import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [

          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Hi, Mohammed',
              textAlign: TextAlign.start,
              style: GoogleFonts.tajawal(
                color: const Color(0xFF242D68),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            headerProps: EasyHeaderProps(
              padding: EdgeInsets.zero,
            ),
            activeColor: Color(0xFF97C7FF),
            dayProps: EasyDayProps(
                height: 80.h,
                width: 60.w,
                todayHighlightColor: Color(0xFF97C7FF),
                borderColor: Colors.transparent,
                activeDayNumStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
                activeDayStrStyle: TextStyle(
                  color: Colors.white,
                ),
                activeMothStrStyle: TextStyle(
                  color: Colors.white,
                ),
              inactiveDayNumStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Color(0xFF929292),
              ),
              inactiveDayStrStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Color(0xFF929292),
              ),
              inactiveMothStrStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                color: Color(0xFF929292),
              )

            ),
            onDateChange: (selectedDate) {
              //`selectedDate` the new date selected.
            },
          ),
          SizedBox(
            height: 35.h,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'My gym subscriptions',
              textAlign: TextAlign.start,
              style: GoogleFonts.tajawal(
                color:  Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsetsDirectional.only(top: 22.h,bottom: 17.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3FC4C4C4),
                  blurRadius: 14.r,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                SvgPicture.asset('images/allGyms.svg',width: 96.w,height: 49.82.h,),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Jeem Name',
                  style: GoogleFonts.tajawal(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '1500 SAR',
                  style: GoogleFonts.tajawal(
                    color: Color(0xFFFF8D2A),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '3 months ',
                  style: GoogleFonts.tajawal(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'End date:',
                      style: GoogleFonts.tajawal(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      '4/11/2023',
                      style: GoogleFonts.tajawal(
                        color: Color(0xFFFF0000),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
