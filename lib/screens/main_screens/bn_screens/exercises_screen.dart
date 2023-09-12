import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/screens/main_screens/bn_screens/exercise_detiles_screen.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: 24.h,
              padding: EdgeInsetsDirectional.only(top: 6.h,bottom: 2.h,start: 14.w,end: 14.w),
              decoration: ShapeDecoration(
                color: Color(0xFF242D68),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              child: Text(
                'Beginner',
                style: GoogleFonts.tajawal(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              // height: 24.h,
              padding: EdgeInsetsDirectional.only(top: 6.h,bottom: 2.h,start: 14.w,end: 14.w),
              decoration: ShapeDecoration(
                color: Color(0xFFF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              child: Text(
                'Intermediate',
                style: GoogleFonts.tajawal(
                  color: Color(0xFFA3A3A3),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              // height: 24.h,
              padding: EdgeInsetsDirectional.only(top: 6.h,bottom: 2.h,start: 18.w,end: 18.w),
              decoration: ShapeDecoration(
                color: Color(0xFFF4F4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              child: Text(
                'Advance',
                style: GoogleFonts.tajawal(
                  color: Color(0xFFA3A3A3),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],),
        SizedBox(height: 24.h,),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
          return Container(
            width: 344.w,
         decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3FC4C4C4),
                  blurRadius: 12,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            padding: EdgeInsetsDirectional.only(start: 16.w,top: 8.h,end: 8.w,bottom: 8.h),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 68.w,
                      height: 64.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF8F8F8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Image.asset('images/young.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Exercise title',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Text(
                          '60 Push up a day',
                          style: GoogleFonts.tajawal(
                            color: Color(0xFF848484),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
                PositionedDirectional(
                bottom: 0.h,
                end: 0.w,
                child: InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseDetilesScreen(),)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 3.h,),
                          Text(
                            'more details',
                            style: GoogleFonts.tajawal(
                              color: Color(0xFFFF8D2A),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,size: 13.w,color: Color(0xFFFF8D2A),)
                    ],
                  ),
                ),
                )
              ],
            ),
          );
        }, separatorBuilder: (context, index) => SizedBox(height: 24.h,), itemCount: 5)
      ],
    );
  }
}
