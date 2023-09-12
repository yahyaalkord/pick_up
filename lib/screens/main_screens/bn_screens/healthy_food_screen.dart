import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;
class HealthyFoodScreen extends StatefulWidget {
  const HealthyFoodScreen({Key? key}) : super(key: key);

  @override
  State<HealthyFoodScreen> createState() => _HealthyFoodScreenState();
}

class _HealthyFoodScreenState extends State<HealthyFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 23.5.w),
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
      return PhysicalModel(
        color: Colors.transparent,
        elevation: 20,
        shadowColor: const Color(0x3FC4C4C4),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 16.h,),
                CustomPaint(
                  size: Size(343.w, (343.w*0.49019607843137253).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Recipe Title',
                              style: GoogleFonts.tajawal(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '1260 Cal',
                              style: GoogleFonts.tajawal(
                                color: Color(0xFFFF8D2A),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '½ cup pure maple syrup\n¼ cup olive oil\n¼ cup Dijon mustard (such as Maille)\n2 tablespoons whole-grain mustard\n½ teaspoon kosher salt\n¼ teaspoon ground allspice\n3 pounds bone-in, skin-on chicken thighs (about 8 thighs)',
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.33,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(child: Image.asset('images/food.png',height: 62.h,width: 62.w,)),
          ],
        ),
      );

    }, separatorBuilder: (context, index) => SizedBox(height: 33.h), itemCount: 4);
  }
}




//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9803922,size.height*0.9142857);
    path_0.lineTo(size.width*0.9803922,180.h*0.09142857);
    path_0.cubicTo(size.width*0.9803922,180.h*0.06618114,size.width*0.9703585,180.h*0.04571429,size.width*0.9579832,180.h*0.04571429);
    path_0.lineTo(size.width*0.7155154,180.h*0.04571429);
    path_0.cubicTo(size.width*0.6594538,180.h*0.04571440,size.width*0.6211681,180.h*0.09661486,size.width*0.6047619,180.h*0.1350297);
    path_0.cubicTo(size.width*0.5686611,180.h*0.2226171,size.width*0.5390252,180.h*0.2816326,size.width*0.4906050,180.h*0.2728451);
    path_0.cubicTo(size.width*0.4355742,180.h*0.2628571,size.width*0.3955938,180.h*0.1475149,size.width*0.3791877,180.h*0.1062183);
    path_0.cubicTo(size.width*0.3605910,180.h*0.04629051,size.width*0.3135546,180.h*0.04571429,size.width*0.2957787,180.h*0.04571429);
    path_0.lineTo(size.width*0.04201681,180.h*0.04571429);
    path_0.cubicTo(size.width*0.02964062,180.h*0.04571429,size.width*0.01960784,180.h*0.06618114,size.width*0.01960784,180.h*0.09142857);
    path_0.lineTo(size.width*0.01960784,size.height*0.9142857);
    path_0.cubicTo(size.width*0.01960784,size.height*0.9395314,size.width*0.02964062,size.height*0.9600000,size.width*0.04201681,size.height*0.9600000);
    path_0.lineTo(size.width*0.9579832,size.height*0.9600000);
    path_0.cubicTo(size.width*0.9703585,size.height*0.9600000,size.width*0.9803922,size.height*0.9395314,size.width*0.9803922,size.height*0.9142857);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
