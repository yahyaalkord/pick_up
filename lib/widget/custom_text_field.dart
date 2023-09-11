import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
    required this.keyboardType,
     this.onTap,
    this.height = 50,
    this.obscure = false,
    this.readOnly = false,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode  focusNode;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscure;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double height;
  final TextAlign textAlign;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: TextField(
        obscureText: obscure,
        controller: textEditingController,
        focusNode: focusNode,
        keyboardType: keyboardType,
        style: GoogleFonts.poppins(),
        enabled: enabled,
        readOnly: readOnly,
        onTap: onTap,
        textAlign: textAlign,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: GoogleFonts.tajawal(
              fontSize: 12.sp, color: Color(0XFFBABABA),),
          fillColor: Colors.transparent,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(width: 0.50.w, color: const Color(0xFF242D68)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(width: 0.50.w, color:textEditingController.text.isNotEmpty? const Color(0xFF242D68): const Color(0xFFE0E0E0)),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide(width: 0.50.w, color:textEditingController.text.isNotEmpty? const Color(0xFF242D68): const Color(0xFFE0E0E0)),
          ),
        ),
      ),
    );
  }
}
