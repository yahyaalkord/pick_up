import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pick_up/widget/custom_text_field.dart';

class CustomFormTextFiled extends StatelessWidget {
  const CustomFormTextFiled({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.title,
    required this.keyboardType,
    this.hintText='',
    this.onTap,
    this.obscure = false,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController textEditingController;
  final String title;
  final String hintText;
  final bool obscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode  focusNode;
  final TextInputType keyboardType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.tajawal(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: focusNode.hasFocus || textEditingController.text.isNotEmpty? const Color(0xFF242D68):const Color(0xFF606060)),
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextField(
            textEditingController: textEditingController,
            focusNode: focusNode,
            hintText: hintText,
            keyboardType: keyboardType,
          obscure: obscure,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          onTap: onTap,
        ),
      ],
    );
  }
}
