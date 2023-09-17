import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/model/exercises_model.dart';

class ExerciseDetilesScreen extends StatefulWidget {
  const ExerciseDetilesScreen({required this.exercisesModel,Key? key}) : super(key: key);
  final ExercisesModel exercisesModel;

  @override
  State<ExerciseDetilesScreen> createState() => _ExerciseDetilesScreenState();
}

class _ExerciseDetilesScreenState extends State<ExerciseDetilesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 56.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
              InkWell(
                onTap:() => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios,)),
              const Spacer(),
              Column(
                children: [
                  SizedBox(height: 3.h,),
                  Text(
                    'Exercise details',
                    style: GoogleFonts.tajawal(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],),
          ),
          SizedBox(height: 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Column(
              children: [
                SizedBox(
                  width: 309.19.w,
                  height: 291.h,
                  child: Image.network(widget.exercisesModel.imageUrl??'',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                ),
                SizedBox(height: 24.h,),
                Text(
                  widget.exercisesModel.title??'',
                  style: GoogleFonts.tajawal(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // height: 24.h,
                      padding: EdgeInsetsDirectional.only(top: 6.h,bottom: 2.h,start: 14.w,end: 14.w),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4F4F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(
                        widget.exercisesModel.type??'',
                        style: GoogleFonts.tajawal(
                          color: const Color(0xFF242D68),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      // height: 24.h,
                      padding: EdgeInsetsDirectional.only(top: 6.h,bottom: 2.h,start: 14.w,end: 14.w),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4F4F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(
                        '${widget.exercisesModel.minutes} Minutes',
                        style: GoogleFonts.tajawal(
                          color: const Color(0xFF242D68),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      // height: 24.h,
                      padding: EdgeInsetsDirectional.only(top: 6.h,bottom: 2.h,start: 14.w,end: 14.w),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4F4F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Text(
                        widget.exercisesModel.workout??'',
                        style: GoogleFonts.tajawal(
                          color: const Color(0xFF242D68),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h,),
                SizedBox(
                  width: 342.w,
                  child: Text(
                    widget.exercisesModel.longDescription??'',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tajawal(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43.h,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
