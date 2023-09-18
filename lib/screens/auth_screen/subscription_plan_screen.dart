import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/get/content_get_controller.dart';
import 'package:pick_up/screens/auth_screen/check_out_screen.dart';
import 'package:pick_up/utils/extention.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({required this.gymId,Key? key}) : super(key: key);
  final int gymId;

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  ContentGetxController controller = ContentGetxController.to;
  @override
  void initState() {
    controller.readSubscription(id: widget.gymId);
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<ContentGetxController>(force: true);
    super.dispose();
  }
  int? selectItem;
  int? selectItemId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        children: [
          SizedBox(height: 40.h,),
          Image.asset(
            'images/pickUpIcon.png',
            width: 96.w,
            height: 85.42.h,
          ),
          SizedBox(height: 24.h,),
          Text(
            'Choose the suitable subscription plan for you',
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              color: const Color(0xFFFF8D2A),
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GetBuilder<ContentGetxController>(
              builder: (ContentGetxController controller) {
                if(controller.loading==true){
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(height: 50.h,),
                        const CircularProgressIndicator()
                      ],
                    ),
                  );
                }else if(controller.allSubscription.isNotEmpty){
                  var sup = controller.allSubscription;
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: sup.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 22.w,
                        mainAxisSpacing: 22.h,
                        childAspectRatio: 140.w/140.h
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectItem = index;
                            selectItemId=sup[index].id!;
                          });
                        },
                        child: SizedBox(
                          width: 140.w,
                          height: 140.h,
                          child: Stack(
                            children: [
                              Visibility(
                                visible: selectItem == index,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(color: const Color(0xFFFF8D2A),width: 2.w)
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                top: 0,
                                start:0,
                                child: Container(
                                  width: 138.w,
                                  height: 138.h,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 30.h),
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
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '${sup[index].price!} SAR',
                                          style: GoogleFonts.tajawal(
                                            color: Colors.black,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Align(
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'For ',
                                                  style: GoogleFonts.tajawal(
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: sup[index].noOfMonths.toString(),
                                                  style: GoogleFonts.tajawal(
                                                    color: const Color(0xFFFF8D2A),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' months',
                                                  style: GoogleFonts.tajawal(
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },);
                }else{
                  return const SizedBox();
                }
              },),

          ),
          SizedBox(height: 32.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 80.w),
            child: ElevatedButton(
              onPressed: () {
                if(selectItemId != null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CheckOutScreen(supId: selectItemId!,),));
                }else{
                  context.showSnackBar(message: 'Please select a subscription plan',error: true);

                }
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(150.w, 40.h),
                minimumSize: Size(150.w, 40.h),
                backgroundColor: const Color(0xFF242D68),
                shape: RoundedRectangleBorder(
                  side:
                  BorderSide(width: 0.50.w, color: const Color(0xFFFF8D2A)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                  child: Text(
                    'Join',
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
