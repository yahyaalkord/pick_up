import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/get/content_get_controller.dart';
import 'package:pick_up/screens/auth_screen/all_trainers_screen.dart';
import 'package:pick_up/utils/extention.dart';

class AllGymsScreen extends StatefulWidget {
  const AllGymsScreen({Key? key}) : super(key: key);

  @override
  State<AllGymsScreen> createState() => _AllGymsScreenState();
}

class _AllGymsScreenState extends State<AllGymsScreen> {
  ContentGetxController controller = Get.put<ContentGetxController>(ContentGetxController());
  int? selectedGym;
  int? selectedGymId;
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
            'Choose the suitable jim for you',
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
                }else if(controller.allGyms.isNotEmpty){
                  var gym = controller.allGyms;
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: gym.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 22.w,
                        mainAxisSpacing: 14.h,
                        childAspectRatio: 158.w/150.h
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedGym = index;
                            selectedGymId = gym[index].id!;
                          });
                        },
                        child: SizedBox(
                          width: 158.w,
                          height: 150.h,
                          child: Stack(
                            children: [
                              Visibility(
                                visible: selectedGym == index,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(color: const Color(0xFFFF8D2A),width: 1.w)
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                top: 0,
                                start:0,
                                child: Container(
                                  width: 156.w,
                                  height: 148.h,
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: 96.w,height: 49.82.h,
                                          child: Image.network(gym[index].imageUrl??'',width: double.infinity.w,height: double.infinity.h,fit: BoxFit.cover,)),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(maxWidth: 150.w),
                                        child: Text(
                                          gym[index].name??'',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.tajawal(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight:selectedGym == index?FontWeight.w700: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints(maxWidth: 120.w),
                                        child: Text(
                                        gym[index].age != null?  'Suitable for ${gym[index].age}+ age':'Suitable for All ages',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: GoogleFonts.tajawal(
                                            color: Colors.black,
                                            fontSize: 13.sp,
                                            fontWeight:selectedGym == index?FontWeight.w700: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
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

          SizedBox(height: 32.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 90.w),
            child: ElevatedButton(
              onPressed: () {
                if(selectedGymId !=null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AllTrainersScreen(gymId: 1),));
                }else{
                  context.showSnackBar(message: 'Please select a Gym',error: true);
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
