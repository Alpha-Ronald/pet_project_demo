import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key, this.userData});

  final Map<String, dynamic>? userData;

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  File? selectedImage;
  bool isLoading = false;

  Future<File?> pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      return File(picked.path);
    }
    return null;
  }

  String getInitials(String name) {
    if (name.isEmpty) return '';

    final parts = name.trim().split(" ");

    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.userData?['name'] ?? "";
    final email = widget.userData?['email'] ?? "";
    final address = widget.userData?['address'] ?? "";

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: () async {
                final file = await pickImage();
                if (file != null) {
                  setState(() {
                    selectedImage = file;
                  });
                }
              },
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.grey.shade300,
                backgroundImage:
                    selectedImage != null ? FileImage(selectedImage!) : null,
                child: selectedImage == null
                    ? Text(getInitials(name),
                        style: TextStyle(fontSize: 20, color: Colors.black))
                    : null,
              ),
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
