import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBackgroundUI extends StatelessWidget {
  final Widget child;
  final String mainText;
  final String? subText;

  const AuthBackgroundUI({
    super.key,
    required this.child,
    required this.mainText,
    this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Large Circle
          Positioned(
            top: 115.h,
            left: -45.w,
            child: Container(
              width: 114.w,
              height: 114.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFFFBF00),
                  width: 1.w,
                ),
              ),
            ),
          ),

          // Smaller Circle
          Positioned(
            top: 115.h,
            left: -40.w,
            child: Container(
              width: 94.w,
              height: 94.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFFFBF00),
                  width: 1.w,
                ),
              ),
            ),
          ),

          // Dot
          Positioned(
            top: 110.h,
            left: 40.w,
            child: Container(
              width: 22.w,
              height: 22.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF001233),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button (UI only)
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // cleaner here
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 24.w,
                      ),
                    ),
                  ),

                  // Title
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 57.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mainText,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D2D2D),
                          ),
                        ),
                        if (subText != null)
                          Text(
                            subText!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2D2D2D),
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}