import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/api_controller/content_api_controller.dart';
import 'package:pick_up/screens/auth_screen/done_screen.dart';
import 'package:pick_up/utils/api_response.dart';
import 'package:pick_up/utils/extention.dart';


class PaymentOptionScreen extends StatefulWidget {
  const PaymentOptionScreen({required this.supId,Key? key}) : super(key: key);
 final int supId;
  @override
  State<PaymentOptionScreen> createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  bool pressed =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 51.w),
        children: [
          SizedBox(height: 40.h,),
          Image.asset(
            'images/pickUpIcon.png',
            width: 96.w,
            height: 85.42.h,
          ),
          SizedBox(height: 24.h,),
          Text(
            'payment Options',
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
              color: const Color(0xFFFF8D2A),
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 24.h,),
          pressed ? Column(
            children: [
              SizedBox(height: 100.h,),
              CircularProgressIndicator()
            ],
          ):
          FutureBuilder(
            future: ContentApiController().getPayments(),
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
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: info.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 132.w/125.23.h,
                    mainAxisSpacing: 23.77.h,
                    crossAxisSpacing: 24.w,), itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async{
                      setState(() {
                        pressed = true;
                      });
                    await  tapped();
                      setState(() {
                        pressed = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                      width: 132.w,
                      height: 125.23.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x3FC4C4C4),
                            blurRadius: 12.r,
                            offset: const Offset(0, 6),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 30.h,width: 64.w,child: Image.network(info[index].imageUrl??'',height: double.infinity.h,width: double.infinity.w,fit: BoxFit.cover,)) ,
                          SizedBox(height: 10.h,),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 120.w),
                            child: Text(
                              info[index].name??'',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.tajawal(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),

                    ),
                  );
                },);
              }else{
                return SizedBox();
              }
            },),

          /*GridView(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 132.w/125.23.h,
            mainAxisSpacing: 23.77.h,
            crossAxisSpacing: 24.w,
          ),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoneScreen(),));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
                  width: 132.w,
                  height: 125.23.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x3FC4C4C4),
                        blurRadius: 12.r,
                        offset: const Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                     Image.asset('images/applePaylogo.png',height: 30.h,width: 64.w,) ,
                      SizedBox(height: 10.h,),
                      Text(
                        'Apple Pay',
                        style: GoogleFonts.tajawal(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),

                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoneScreen(),));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  width: 132.w,
                  height: 125.23.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x3FC4C4C4),
                        blurRadius: 12.r,
                        offset: const Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset('images/mada1.png',height: 64.h,width: 64.w,) ,
                      Text(
                        'Mada',
                        style: GoogleFonts.tajawal(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),

                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoneScreen(),));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  width: 132.w,
                  height: 125.23.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x3FC4C4C4),
                        blurRadius: 12.r,
                        offset: const Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset('images/cashPayment.png',height: 64.h,width: 64.w,) ,
                      SizedBox(height: 10.h,),
                      Text(
                        'Cash',
                        style: GoogleFonts.tajawal(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),

                ),
              ),
            ],
          ),*/
          SizedBox(height: 50.h,),
        ],
      ),
    );
  }
  Future<void> tapped() async{
    ApiResponse apiResponse = await ContentApiController().storeSubscriptionSend(id: widget.supId);
    if(apiResponse.success){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DoneScreen(subscription: apiResponse.object),), (route) => false);
    }else{
      context.showSnackBar(message: apiResponse.message,error: !apiResponse.success);
    }
  }
}
