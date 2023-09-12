import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/screens/auth_screen/verification_code_screen.dart';
import 'package:pick_up/widget/custom_form_text_filed.dart';
import 'package:pick_up/widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameEditingController;
  late TextEditingController birthDate1EditingController;
  late TextEditingController birthDate2EditingController;
  late TextEditingController birthDate3EditingController;
  late TextEditingController phoneEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController passwordConfirmEditingController;
  late FocusNode nameFocusNode;
  late FocusNode birthDate1FocusNode;
  late FocusNode birthDate2FocusNode;
  late FocusNode birthDate3FocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode passwordConfirmFocusNode;
  bool obscure = true;
  bool obscure1 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameEditingController = TextEditingController();
    birthDate1EditingController = TextEditingController();
    birthDate2EditingController = TextEditingController();
    birthDate3EditingController = TextEditingController();
    phoneEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    passwordConfirmEditingController = TextEditingController();
    nameFocusNode = FocusNode();
    birthDate1FocusNode = FocusNode();
    birthDate2FocusNode = FocusNode();
    birthDate3FocusNode = FocusNode();
    phoneFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    passwordConfirmFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    birthDate1EditingController.dispose();
    birthDate2EditingController.dispose();
    birthDate3EditingController.dispose();
    phoneEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    passwordConfirmEditingController.dispose();
    nameFocusNode.dispose();
    birthDate1FocusNode.dispose();
    birthDate2FocusNode.dispose();
    birthDate3FocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0XFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          SizedBox(
            height: 40.h,
          ),
          Image.asset(
            'images/pickUpIcon.png',
            width: 112.w,
            height: 99.66.h,
          ),
          Text(
            'Sign up',
            textAlign: TextAlign.center,
            style: GoogleFonts.sriracha(
                fontWeight: FontWeight.w400,
                fontSize: 32.sp,
                color: const Color(0XFF242D68)),
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomFormTextFiled(
            textEditingController: nameEditingController,
            title: 'Name',
            hintText: 'Ex: Mohammed Ali',
            focusNode: nameFocusNode,
            keyboardType: TextInputType.text,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset('images/user.svg',
                  width: 22.w,
                  height: 22.h,
                  colorFilter: ColorFilter.mode(
                      nameFocusNode.hasFocus ||
                              nameEditingController.text.isNotEmpty
                          ? const Color(0xFFFF8D2A)
                          : Colors.grey,
                      BlendMode.srcIn)),
            ),
            onTap: () {
              setState(() {});
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Birth date',
            style: GoogleFonts.tajawal(
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                color: birthDate1FocusNode.hasFocus ||
                        birthDate1EditingController.text.isNotEmpty ||
                        birthDate2FocusNode.hasFocus ||
                        birthDate2EditingController.text.isNotEmpty ||
                        birthDate3FocusNode.hasFocus ||
                        birthDate3EditingController.text.isNotEmpty
                    ? const Color(0xFF242D68)
                    : const Color(0xFF606060)),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  textEditingController: birthDate1EditingController,
                  focusNode: birthDate1FocusNode,
                  hintText: 'YYYY',
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  onTap: () => setState(() {}),
                ),
              ),
              SizedBox(width: 7.w,),
              Expanded(
                child: CustomTextField(
                  textEditingController: birthDate2EditingController,
                  focusNode: birthDate2FocusNode,
                  hintText: 'MM',
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  onTap: () => setState(() {}),
                ),
              ),
              SizedBox(width: 7.w,),
              Expanded(
                child: CustomTextField(
                  textEditingController: birthDate3EditingController,
                  focusNode: birthDate3FocusNode,
                  hintText: 'DD',
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  onTap: () => setState(() {}),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomFormTextFiled(
            textEditingController: phoneEditingController,
            title: 'Phone number',
            hintText: '+9661364978521',
            focusNode: phoneFocusNode,
            keyboardType: TextInputType.number,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset('images/call.svg',
                  width: 22.w,
                  height: 22.h,
                  colorFilter: ColorFilter.mode(
                      phoneFocusNode.hasFocus ||
                              phoneEditingController.text.isNotEmpty
                          ? const Color(0xFFFF8D2A)
                          : Colors.grey,
                      BlendMode.srcIn)),
            ),
            onTap: () {
              setState(() {});
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomFormTextFiled(
            textEditingController: emailEditingController,
            title: 'Email',
            hintText: 'Ex: moh@gmail.com',
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
            height: 16.h,
          ),
          CustomFormTextFiled(
            textEditingController: passwordEditingController,
            title: 'Password',
            hintText: 'Write your password',
            obscure: obscure,
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
            suffixIcon: IconButton(onPressed: () {
              setState(() {
                obscure = !obscure;
              });
            }, icon: Icon(obscure?Icons.visibility:Icons.visibility_off)),
            onTap: () {
              setState(() {});
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomFormTextFiled(
            textEditingController: passwordConfirmEditingController,
            title: 'Confirm Password',
            hintText: 'Write your password again',
            obscure: obscure1,
            focusNode: passwordConfirmFocusNode,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SvgPicture.asset('images/lock.svg',
                  width: 22.w,
                  height: 22.h,
                  colorFilter: ColorFilter.mode(
                      passwordConfirmFocusNode.hasFocus ||
                              passwordConfirmEditingController
                                  .text.isNotEmpty
                          ? const Color(0xFFFF8D2A)
                          : Colors.grey,
                      BlendMode.srcIn)),
            ),
            suffixIcon: IconButton(onPressed: () {
              setState(() {
                obscure1 = !obscure1;
              });
            }, icon: Icon(obscure1?Icons.visibility:Icons.visibility_off)),
            onTap: () {
              setState(() {});
            },
          ),
          SizedBox(
            height: 32.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 80.w),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationCode(),));
              },
              style: ElevatedButton.styleFrom(
                maximumSize: Size(178.w, 40.h),
                minimumSize: Size(178.w, 40.h),
                backgroundColor: const Color(0xFF242D68),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 0.50.w, color: const Color(0xFFFF8D2A)),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Center(
                  child: Text(
                'Sign up',
                style: GoogleFonts.tajawal(
                  color: Colors.white,
                  fontSize: 16.sp,
                  height: 2.h,
                  fontWeight: FontWeight.w700,
                ),
              )),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: SvgPicture.asset(
                'images/gime.svg',
                height: 82.h,
                width: 158.w,
              ))
        ],
      ),
    );
  }
}
