import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/features/widgets/auth_textfield.dart';
import 'package:untitled/services/auth_service.dart';
import 'package:untitled/services/user_provider.dart';
import 'package:untitled/services/user_service.dart';

import '../../services/storage_service.dart';

class ProfileSection extends ConsumerStatefulWidget {
  const ProfileSection({super.key, this.userData});

  final Map<String, dynamic>? userData;

  @override
  ConsumerState<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends ConsumerState<ProfileSection> {
  File? selectedImage;
  bool isLoading = false;

  final nameController = TextEditingController();
  final addressController = TextEditingController();

  String? uploadedImageURL;
  bool hasChanged = false;


  // @override
  // void initState() {
  //   super.initState();
  //
  //   nameController.text = widget.userData?['name'] ?? "";
  //   addressController.text = widget.userData?['address'] ?? "";
  //
  //   nameController.addListener(_onChanged);
  //   addressController.addListener(_onChanged);
  //
  // }


  void _onChanged() {
    final user = ref.read(userProvider);

    final isDifferent =
        nameController.text.trim() != user?.name ||
            addressController.text.trim() != user?.address ||
            selectedImage != null;

    setState(() => hasChanged = isDifferent);
  }
  bool initialized = false;


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
    final user = ref.watch(userProvider); // ✅ FIXED

    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!initialized) {
      nameController.text = user.name;
      addressController.text = user.address;
      initialized = true;
    }


    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : (user.imageUrl != null
                          ? NetworkImage(user.imageUrl!)
                          : null),
                      child: selectedImage == null &&
                          user.imageUrl == null
                          ? Text(getInitials(user.name))
                          : null,
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          final file = await pickImage();


                          if (file != null) {
                            setState(() {

                              isLoading = true;
                            });

                            try{
                              final uid = AuthService().currentUser!.uid;

                              final url = await StorageService().uploadProfileImage(uid: uid, file: file);

                              setState(() {
                                selectedImage = file;
                                uploadedImageURL =url;
                                hasChanged =true;
                              });
                            }
                            catch(e){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('UPLOAD FAILED')));

                            }

                            finally {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          }

                        },
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),

                          child: Icon(Icons.edit,color: Colors.white,size: 16,),
                        ),
                      ),
                    )

                  ]
                ),




              ],
            ),


            SizedBox(height: 12.h),


            CustomTextFieldUI(label: "Name", controller: nameController,onChanged: (_) => _onChanged(),),
            CustomTextFieldUI(label: "Address", controller: addressController,   onChanged: (_) => _onChanged(),),

            // Text(
            //   name,
            //   style: TextStyle(
            //     fontSize: 16.sp,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),


            SizedBox(height: 4.h),
            Text(
              user!.email,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.h),


            SizedBox(
              width: double.infinity,
              child:  ElevatedButton(
                onPressed: (!hasChanged || isLoading)
                    ? null
                    : () async {
                  setState(() => isLoading = true);

                  try {
                    await ref
                        .read(userProvider.notifier)
                        .updateUser(
                      name: nameController.text.trim(),
                      address: addressController.text.trim(),
                      imageUrl: uploadedImageURL,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Updated")),
                    );

                    setState(() {
                      hasChanged = false;
                      selectedImage = null;
                      uploadedImageURL = null;
                    });
                  } finally {
                    setState(() => isLoading = false);
                  }
                },
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Update Profile"),
              ),),

            SizedBox(height: 40.h),
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
                      user.address,
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
