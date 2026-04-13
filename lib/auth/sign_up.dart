import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_background.dart';
import 'auth_textfield.dart';



class SignupScreenUI extends StatelessWidget {
  const SignupScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      mainText: 'Glad to have you',
      subText: 'here!',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFieldUI(label: "Full name"),
            const CustomTextFieldUI(label: "Email"),
            const CustomTextFieldUI(label: "Password", isPassword: true),
            const CustomTextFieldUI(label: "Confirm Password", isPassword: true),

            // Terms
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: RichText(
                text: TextSpan(
                  text: "By signing up you're agreeing with our ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "terms & conditions",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF001233),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 22.h),

            // Sign Up Button (UI only)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF001233),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // OR Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text("Or", style: TextStyle(fontSize: 16.sp)),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // Google Signup (UI only)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: 56.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFFFFBF00)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.g_translate, color: Colors.black),
                    SizedBox(width: 8.w),
                    Text(
                      "Sign up with Google",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.h),

            // Login Link (UI only)
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF001233),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}