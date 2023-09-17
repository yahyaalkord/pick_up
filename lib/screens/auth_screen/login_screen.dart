import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/api_controller/auth_api_controller.dart';
import 'package:pick_up/prefs/shared_pref_controller.dart';
import 'package:pick_up/screens/auth_screen/all_gyms_screen.dart';
import 'package:pick_up/screens/auth_screen/register_screen.dart';
import 'package:pick_up/screens/main_screens/bn_screen.dart';
import 'package:pick_up/utils/api_response.dart';
import 'package:pick_up/utils/extention.dart';
import 'package:pick_up/widget/custom_form_text_filed.dart';
import 'package:pick_up/widget/custom_text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  bool tapped = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(
              height: 48.h,
            ),
            Image.asset(
              'images/pickUpIcon.png',
              width: 128.w,
              height: 113.9.h,
            ),
            SizedBox(
              height: 90.h,
            ),
            Text(
              'Sign in',
              style: GoogleFonts.sriracha(
                  fontWeight: FontWeight.w400,
                  fontSize: 32.sp,
                  color: const Color(0XFF242D68)),
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomFormTextFiled(
              textEditingController: emailEditingController,
              title: 'Email',
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: SvgPicture.asset('images/sms.svg',
                    width: 22.w,
                    height: 22.h,
                    colorFilter: ColorFilter.mode(
                        emailFocusNode.hasFocus ||
                                emailEditingController.text.isNotEmpty
                            ? const Color(0xFFFF8D2A)
                            : Colors.grey,
                        BlendMode.srcIn)),
              ),
              onTap: () {
                setState(() {});
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomFormTextFiled(
              textEditingController: passwordEditingController,
              title: 'Password',
              obscure: true,
              focusNode: passwordFocusNode,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: SvgPicture.asset('images/lock.svg',
                    width: 22.w,
                    height: 22.h,
                    colorFilter: ColorFilter.mode(
                        passwordFocusNode.hasFocus ||
                                passwordEditingController.text.isNotEmpty
                            ? const Color(0xFFFF8D2A)
                            : Colors.grey,
                        BlendMode.srcIn)),
              ),
              onTap: () {
                setState(() {});
              },
            ),
            SizedBox(
              height: 32.h,
            ),
            tapped?CircularProgressIndicator():ElevatedButton(
              onPressed: () async{
                setState(() {
                   tapped = true;
                });
                await performLogin();
                setState(() {
                  tapped = false;
                });
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
                'Sign in',
                style: GoogleFonts.tajawal(
                  color: Colors.white,
                  fontSize: 16.sp,
                  height: 2.h,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ),
            SizedBox(
              height: 48.h,
            ),
            const Divider(height: 0,),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'You don’t have account ',
                      style: GoogleFonts.tajawal(
                        color: const Color(0xFF929292),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ' Sign up',
                      style: GoogleFonts.tajawal(
                        color: const Color(0xFF242D68),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
              Align(alignment : AlignmentDirectional.bottomEnd,child: SvgPicture.asset('images/gime.svg',height: 82.h,width: 158.w,))
          ],
        ),
      ),
    );
  }

  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (emailEditingController.text.isNotEmpty &&
        passwordEditingController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(
        message: 'enter required data!', error: true);
    return false;
  }

  Future<void> login() async {
    ApiResponse apiResponse = await AuthApiController().login(
      email: emailEditingController.text,
      password: passwordEditingController.text,
    );
    if (apiResponse.success) {
      SharedPrefController().getValueFor(key: prefKeys.userComplete.name)?
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(),), (route) => false):
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AllGymsScreen(),), (route) => false);
    }
    context.showSnackBar(
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
