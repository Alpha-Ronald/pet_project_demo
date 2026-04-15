import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Text(
              "Welcome 👋",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2D2D2D),
              ),
            ),

            SizedBox(height: 20.h),

            // Simple cards
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFFBF00).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_offer, color: Color(0xFF001233)),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      "Check out latest offers available for you",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.history, color: Color(0xFF001233)),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      "Your recent activities will appear here",
                      style: TextStyle(fontSize: 14.sp),
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