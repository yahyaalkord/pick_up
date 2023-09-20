import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/api_controller/auth_api_controller.dart';
import 'package:pick_up/screens/auth_screen/login_screen.dart';
import 'package:pick_up/utils/api_response.dart';
import 'package:pick_up/utils/extention.dart';
import 'package:pick_up/widget/timer_widget.dart';

class VerificationCode extends StatefulWidget {

  const VerificationCode({required this.email,Key? key,}) : super(key: key);
  final String email;

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  late FocusNode _firstNode;
  late FocusNode _secondNode;
  late FocusNode _thirdNode;
  late FocusNode _fourthNode;
  late FocusNode _fifthNode;
  late TextEditingController _first;
  late TextEditingController _second;
  late TextEditingController _third;
  late TextEditingController _fourth;
  late TextEditingController _fifth;
  bool resendCode = false;
  bool tapped = false;

  @override
  void initState() {
    super.initState();
    _firstNode = FocusNode();
    _secondNode = FocusNode();
    _thirdNode = FocusNode();
    _fourthNode = FocusNode();
    _fifthNode = FocusNode();
    _first = TextEditingController();
    _second = TextEditingController();
    _third = TextEditingController();
    _fourth = TextEditingController();
    _fifth = TextEditingController();
  }

  @override
  void dispose() {
    _firstNode.dispose();
    _secondNode.dispose();
    _thirdNode.dispose();
    _fourthNode.dispose();
    _fifthNode.dispose();
    _first.dispose();
    _second.dispose();
    _third.dispose();
    _fourth.dispose();
    _fifth.dispose();
    super.dispose();
  }
  late String newCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFFFFFFFF),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          children: [
            SizedBox(height: 60.h,),
            Image.asset(
              'images/pickUpIcon.png',
              width: 128.w,
              height: 113.9.h,
            ),
            SizedBox(height: 44.h,),
            Text(
              'Verification code',
              style: GoogleFonts.tajawal(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h,),
            Text(
              'Please check your Email Address, Enter the 4-digit code',
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 23.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 66.w,
                    decoration: BoxDecoration(
                      color: const Color(0XFFFAFBFF),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextField(
                      controller: _first,
                      focusNode: _firstNode,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      cursorColor: const Color(0XFFFF8D2A),
                      textAlign: TextAlign.center,
                      onChanged: (String value) {
                        if(value.isNotEmpty)
                          _secondNode.requestFocus();

                      },
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFFFF8D2A),
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Container(
                    width: 66.w,
                    decoration: BoxDecoration(
                      color: const Color(0XFFFAFBFF),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextField(
                      controller: _second,
                      focusNode: _secondNode,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (String value) {
                        value.isNotEmpty?_thirdNode.requestFocus():_firstNode.requestFocus();
                      },
                      cursorColor: const Color(0XFFFF8D2A),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFFFF8D2A),
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Container(
                    width: 66.w,
                    decoration: BoxDecoration(
                      color: const Color(0XFFFAFBFF),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextField(
                      controller: _third,
                      focusNode: _thirdNode,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      onChanged: (String value) {
                        value.isNotEmpty? _fourthNode.requestFocus():_secondNode.requestFocus();
                      },
                      cursorColor: const Color(0XFFFF8D2A),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFFFF8D2A),
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Container(
                    width: 66.w,
                    decoration: BoxDecoration(
                      color: const Color(0XFFFAFBFF),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TextField(
                      controller: _fourth,
                      focusNode: _fourthNode,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (String value) {
                        value.isNotEmpty ? _fifthNode.requestFocus():_thirdNode.requestFocus();
                      },
                      cursorColor: const Color(0XFFFF8D2A),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0.50.w,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFFFF8D2A),
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h,),
            Align(
                alignment: AlignmentDirectional.center,
                child: resendCode? Text(
                  '00:0',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                    fontSize: 13.sp,
                    color: const Color(0xFFA7A9B7),
                  ),
                ):TimerWidget()),
            SizedBox(height: 39.h,),
            tapped?const CircularProgressIndicator():ElevatedButton(
              onPressed: () async{
                {
                  setState(() {
                    tapped = true;
                  });
                  await performForgetPassword();
                  setState(() {
                    tapped = false;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(181.w, 40.h),
                minimumSize: Size(181.w, 40.h),
                backgroundColor: const Color(0xFF242D68),
                shape: RoundedRectangleBorder(
                  side:
                  BorderSide(width: 0.50.w, color: const Color(0xFFFF8D2A)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                  child: Text(
                    'Check Code',
                    style: GoogleFonts.tajawal(
                      color: Colors.white,
                      fontSize: 16.sp,
                      height: 2.h,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            SizedBox(height: 36.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t received the code? ',
                  style: GoogleFonts.tajawal(
                    color: const Color(0xFFA7A9B7),
                    fontSize: 13.sp,
                  ),
                ),
                Visibility(
                  visible: resendCode,
                  replacement: Text(
                    'Resend Code',
                    style: GoogleFonts.tajawal(
                      color: Colors.grey,
                      fontSize: 13.sp,
                      // decoration: TextDecoration.underline,
                      // decorationThickness: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      setState(() {
                        resendCode = false;
                      });
                      Future.delayed(const Duration(seconds: 60),(){
                        setState(() {
                          resendCode = true;
                        });
                      });

                    },
                    child: Text(
                      'Resend Code',
                      style: GoogleFonts.tajawal(
                        color: const Color(0XFFFF8D2A),
                        fontSize: 13.sp,
                        // decoration: TextDecoration.underline,
                        // decorationThickness: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ///
          ],
        ),
      ),
    );
  }
  Future<void> performForgetPassword() async {
    if (checkCode()) {
      await forgetPassword();
    }
  }

  bool checkCode() {
    if (_first.text.isNotEmpty &&
        _second.text.isNotEmpty &&
        _third.text.isNotEmpty &&
        _fourth.text.isNotEmpty) {
      return true;
    }else{

      context.showSnackBar(message: 'Please enter the activation code!', error: true);
      return false;
    }

  }


  Future<void> forgetPassword() async {
    ApiResponse apiResponse = await AuthApiController().checkCode(
      code: _first.text + _second.text + _third.text + _fourth.text,
      email: widget.email,
    );
    if (apiResponse.success) {
      context.showSnackBar(message: apiResponse.message);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  LogInScreen(),), (route) => false);

    }else{
      context.showSnackBar(message: apiResponse.message,error: !apiResponse.success);
    }
  }


}
