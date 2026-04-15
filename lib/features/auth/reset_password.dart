import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/auth_background.dart';
import '../widgets/auth_textfield.dart';



class ResetPasswordScreen1UI extends StatelessWidget {
  const ResetPasswordScreen1UI({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      mainText: 'Reset password',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),


            Center(
              child: Icon(
                Icons.email_outlined,
                size: 120.sp,
                color: const Color(0xFF001233),
              ),
            ),

            SizedBox(height: 50.h),

            // Info text
            Align(
              alignment: Alignment.center,
              child: Text(
                'Your new password will be sent to your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF2D2D2D),
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ),

            SizedBox(height: 24.h),


            const CustomTextFieldUI(
              label: "Email",
            ),


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
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ResetPasswordScreen2UI extends StatelessWidget {
  const ResetPasswordScreen2UI({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      mainText: 'Reset password',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),

            Center(
              child: Icon(
                Icons.mark_email_read_outlined,
                size: 120.sp,
                color: const Color(0xFF001233),
              ),
            ),

            SizedBox(height: 50.h),

            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Your new password has been sent to your email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF2D2D2D),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    'successfully!',
                    style: TextStyle(
                      color: const Color(0xFF2D2D2D),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}