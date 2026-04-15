
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFieldUI extends StatelessWidget {
  final String label;
  final bool isPassword;
  final double? height;
  final double? width;
  final TextEditingController? controller;

  const CustomTextFieldUI({
    super.key,
    required this.label,
    this.isPassword = false,
    this.height,
    this.width,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: SizedBox(
        width: width ?? 358.w,
        height: height ?? 72.h,
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          enabled: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: label,
            labelStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Color(0xFF001233)),
            ),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            suffixIcon: isPassword
                ? Icon(Icons.visibility_off, color: Colors.grey.shade600)
                : null,
          ),
        ),
      ),
    );
  }
}