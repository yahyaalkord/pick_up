import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/api_controller/auth_api_controller.dart';
import 'package:pick_up/api_controller/content_api_controller.dart';
import 'package:pick_up/prefs/shared_pref_controller.dart';
import 'package:pick_up/screens/auth_screen/login_screen.dart';
import 'package:pick_up/utils/api_response.dart';

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
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Hi, ${SharedPrefController().getValueFor(key: prefKeys.name.name)}',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.tajawal(
                    color: const Color(0xFF242D68),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () async{
                bool apiResponse =  await AuthApiController().logout();
                if(apiResponse == true){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LogInScreen(),), (route) => false);
                }
              }, icon: Icon(Icons.logout)),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            headerProps: const EasyHeaderProps(
              padding: EdgeInsets.zero,
            ),
            activeColor: const Color(0xFF97C7FF),
            dayProps: EasyDayProps(
                height: 80.h,
                width: 60.w,
                todayHighlightColor: const Color(0xFF97C7FF),
                borderColor: Colors.transparent,
                activeDayNumStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
                activeDayStrStyle: const TextStyle(
                  color: Colors.white,
                ),
                activeMothStrStyle: const TextStyle(
                  color: Colors.white,
                ),
              inactiveDayNumStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0xFF929292),
              ),
              inactiveDayStrStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0xFF929292),
              ),
              inactiveMothStrStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                color: const Color(0xFF929292),
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
          FutureBuilder(
            future: ContentApiController().getHomeData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50.h,),
                      CircularProgressIndicator()
                    ],
                  ),
                );
              }else if(snapshot.hasData&&snapshot.data != null){
                var info = snapshot.data!;
                return ListView.separated(
                  shrinkWrap:true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsetsDirectional.only(top: 22.h,bottom: 17.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x3FC4C4C4),
                          blurRadius: 14.r,
                          offset: const Offset(0, 3),
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
                          info[index].subscription!.name??'',
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
                          '${info[index].subscription!.price} SAR',
                          style: GoogleFonts.tajawal(
                            color: const Color(0xFFFF8D2A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          '${info[index].subscription!.noOfMonths} months ',
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
                              info[index].subscription!.endDate??'',
                              style: GoogleFonts.tajawal(
                                color: const Color(0xFFFF0000),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) {
                  return SizedBox(height: 16.h,);
                }, itemCount: info.length);
              }else{
                return SizedBox();
              }
            },),

        ],
      ),
    );
  }
}
