import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final name = "Ronald Adewoye";
    final email = "ronald.dev@example.com";
    final address = "Abuja, Nigeria";

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, size: 40),
            ),

            SizedBox(height: 12.h),

            Text(
              name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              email,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 20.h),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 18),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      address,
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                // Demo action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Settings clicked")),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                // Demo action
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logout clicked")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}