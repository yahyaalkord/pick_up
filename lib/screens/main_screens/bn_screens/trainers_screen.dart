import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/api_controller/content_api_controller.dart';

class TrainersScreen extends StatefulWidget {
  const TrainersScreen({Key? key}) : super(key: key);

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ContentApiController().getTrainerChoose(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                const CircularProgressIndicator()
              ],
            ),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          var info = snapshot.data!;
          return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 31.5.w),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PhysicalModel(
                  color: Colors.transparent,
                  elevation: 20,
                  shadowColor: const Color(0x3FC4C4C4),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 30.h,),
                          CustomPaint(
                            size: Size(327.w, (327.w*0.5131964809384164).toDouble()),
                            painter: RPSCustomPainter(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(top: 55.h,start: 18.w,end: 18.w,bottom: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    info[index].name??'',
                                    style: GoogleFonts.tajawal(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 8.h,),
                                  SizedBox(
                                    width: 295.w,
                                    child: Text(
                                      info[index].description??'',
                                      style: GoogleFonts.tajawal(
                                        color: Colors.black,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h,),
                                  /*Row(
                                    children: [
                                      Spacer(),
                                      ElevatedButton(
                                        onPressed: () {
                                        },
                                        style: ElevatedButton.styleFrom(
                                          maximumSize: Size(100.w, 30.h),
                                          minimumSize: Size(100.w, 30.h),
                                          backgroundColor: const Color(0xFF242D68),
                                          shape: RoundedRectangleBorder(
                                            side:
                                            BorderSide(width: 0.50.w, color: const Color(0xFFFF8D2A)),
                                            borderRadius: BorderRadius.circular(8.r),
                                          ),
                                        ),
                                        child: Center(
                                            child: Text(
                                              'Choose',
                                              style: GoogleFonts.tajawal(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                height: 1.5.h,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsetsDirectional.only(start: 40.w),
                        child: Container(
                          width: 66.w,
                          height: 66.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child:Center(child: Image.network(info[index].imageUrl??'',height: double.infinity.h,width: double.infinity.w,)),
                        ),
                      )

                    ],
                  ),
                );
              }, separatorBuilder: (context, index) => SizedBox(height: 20.h,), itemCount: info.length);
        } else {
          return const SizedBox();
        }
      },
    );

  }
}



//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9794721,size.height*0.9142857);
    path_0.lineTo(size.width*0.9794721,180.h*0.09142857);
    path_0.cubicTo(size.width*0.9794721,180.h*0.06618114,size.width*0.9689677,180.h*0.04571429,size.width*0.9560117,180.h*0.04571429);
    path_0.lineTo(size.width*0.4411202,180.h*0.04571429);
    path_0.cubicTo(size.width*0.3851642,180.h*0.04571440,size.width*0.3469531,180.h*0.09661486,size.width*0.3305748,180.h*0.1350297);
    path_0.cubicTo(size.width*0.2945455,180.h*0.2226171,size.width*0.2649657,180.h*0.2816326,size.width*0.2166402,180.h*0.2728451);
    path_0.cubicTo(size.width*0.1617135,180.h*0.2628571,size.width*0.1218106,180.h*0.1475149,size.width*0.1054337,180.h*0.1062183);
    path_0.cubicTo(size.width*0.08687331,180.h*0.04629051,size.width*0.03992639,180.h*0.04571429,size.width*0.02218490,180.h*0.04571429);
    path_0.cubicTo(size.width*0.02126974,180.h*0.04571429,size.width*0.02052786,180.h*0.04715989,size.width*0.02052786,180.h*0.04894314);
    path_0.lineTo(size.width*0.02052786,size.height*0.9142857);
    path_0.cubicTo(size.width*0.02052786,size.height*0.9395314,size.width*0.03103138,size.height*0.9600000,size.width*0.04398827,size.height*0.9600000);
    path_0.lineTo(size.width*0.9560117,size.height*0.9600000);
    path_0.cubicTo(size.width*0.9689677,size.height*0.9600000,size.width*0.9794721,size.height*0.9395314,size.width*0.9794721,size.height*0.9142857);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
