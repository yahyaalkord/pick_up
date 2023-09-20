import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/get/content_get_controller.dart';
import 'package:pick_up/screens/auth_screen/subscription_plan_screen.dart';
import 'package:pick_up/utils/extention.dart';

class AllTrainersScreen extends StatefulWidget {
  const AllTrainersScreen({required this.gymId,Key? key}) : super(key: key);
  final int gymId;

  @override
  State<AllTrainersScreen> createState() => _AllTrainersScreenState();
}

class _AllTrainersScreenState extends State<AllTrainersScreen> {
  ContentGetxController controller = ContentGetxController.to;
  @override
  void initState() {
    print(widget.gymId);
    controller.readTrainers(id: widget.gymId);
    super.initState();
  }
  int? selectedTrainer;
  int? selectedTrainerId;
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
          GetBuilder<ContentGetxController>(
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
              }else if(controller.allTrainers.isNotEmpty){
                var trainer = controller.allTrainers;
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedTrainer = index;
                            selectedTrainerId = trainer[index].id!;
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
                                      child: Image.network(trainer[index].imageUrl??'',height: double.infinity, width: double.infinity,fit: BoxFit.cover,),
                                    ),
                                    SizedBox(width: 8.w,),
                                    Expanded(
                                      child: Text(
                                        trainer[index].description??'',
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
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
                    }, separatorBuilder: (context, index) => SizedBox(height: 16.h,), itemCount: trainer.length);
              }else{
                return const SizedBox();
              }
            },),
          SizedBox(height: 32.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 90.w),
            child: ElevatedButton(
              onPressed: () {
                if(selectedTrainerId != null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  SubscriptionPlanScreen(gymId: widget.gymId),));

                }else{
                  context.showSnackBar(message: 'Please select a Trainer',error: true);
                }
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
