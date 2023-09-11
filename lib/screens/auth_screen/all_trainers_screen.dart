import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/screens/auth_screen/subscription_plan_screen.dart';

class AllTrainersScreen extends StatefulWidget {
  const AllTrainersScreen({Key? key}) : super(key: key);

  @override
  State<AllTrainersScreen> createState() => _AllTrainersScreenState();
}

class _AllTrainersScreenState extends State<AllTrainersScreen> {
  int? selectedTrainer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 40.h,),
          Image.asset(
            'images/pickUpIcon.png',
            width: 96.w,
            height: 85.42.h,
          ),
          SizedBox(height: 24.h,),
          Text(
            'Choose the suitable trainer for you',
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              color: const Color(0xFFFF8D2A),
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24.h,),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedTrainer = index;
                });
              },
              child: SizedBox(
                width: 350.w,
                height: 82.h,
                child: Stack(
                  children: [
                    Visibility(
                      visible: selectedTrainer == index,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: const Color(0xFFFF8D2A),width: 1.w)
                        ),
                      ),
                    ),
                    Container(
                      width: 348.w,
                      height: 80.h,
                      padding: EdgeInsetsDirectional.only(start: 16.w,end: 20.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: const[
                           BoxShadow(
                            color: Color(0x3FC4C4C4),
                            blurRadius: 12,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFEAEAEA),
                              shape: OvalBorder(),
                            ),
                            child: Image.asset('images/charlie.png',height: double.infinity, width: double.infinity,fit: BoxFit.cover,),
                          ),
                          SizedBox(width: 8.w,),
                          Expanded(
                            child: Text(
                              '''He hold a personal training professional certificate''',
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.tajawal(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: selectedTrainer == index?FontWeight.w700:FontWeight.w400,
                                height: 1.43.h,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }, separatorBuilder: (context, index) => SizedBox(height: 16.h,), itemCount: 6),
          SizedBox(height: 32.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 90.w),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SubscriptionPlanScreen(),));
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(178.w, 40.h),
                minimumSize: Size(178.w, 40.h),
                backgroundColor: const Color(0xFF242D68),
                shape: RoundedRectangleBorder(
                  side:
                  BorderSide(width: 0.50.w, color: const Color(0xFFFF8D2A)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                  child: Text(
                    'Next',
                    style: GoogleFonts.tajawal(
                      color: Colors.white,
                      fontSize: 16.sp,
                      height: 2.h,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
          ),
          SizedBox(height: 50.h,),
        ],
      ),
    );
  }
}
