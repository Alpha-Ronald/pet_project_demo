import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/auth/reset_password.dart';
import 'package:untitled/features/auth/sign_up.dart';
import 'package:untitled/services/auth_service.dart';
import 'package:untitled/services/user_service.dart';

import '../dashboard/dashboard.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_textfield.dart';

class LoginScreenUI extends StatefulWidget {
  LoginScreenUI({super.key});

  @override
  State<LoginScreenUI> createState() => _LoginScreenUIState();
}

class _LoginScreenUIState extends State<LoginScreenUI> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool isLoading = false;
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      mainText: "Glad you're here",
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),

            Padding(
              
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField(
                  value: selectedRole,
                  hint: Text('Select a Role'),
                  items: ["Customer", "Admin"].map((role) =>
                      DropdownMenuItem(value: role, child: Text(role))).toList(),
                  onChanged: (value){
                    setState(() {
                      selectedRole = value;
                    });
                  }),
            ),

            CustomTextFieldUI(
              label: "Email",
              controller: emailController,
            ),
            CustomTextFieldUI(
              label: "Password",
              isPassword: true,
              controller: passwordController,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ResetPasswordScreen1UI(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const DashboardScreenUI(),
                    ),
                  );
                },
                child: GestureDetector(
                  onTap: isLoading
                      ? null
                      : () async {
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();

                          setState(() {
                            isLoading = true;
                          });

                          try {
                            final user =
                                await AuthService().login(email, password);

                            if (user != null && user.emailVerified) {


                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DashboardScreenUI(

                                    ),
                                  ));
                            } else {
                              final currentUser = AuthService().currentUser;

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Email not verified, verification link sent again')));

                              await currentUser?.sendEmailVerification();
                            }
                          } catch (e) {
                            String message = "Login failed";
                            debugPrint(e.toString());
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                  child: Container(
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF001233),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    alignment: Alignment.center,
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24.h),

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

            SizedBox(height: 24.h),

            // Google Button (UI only)
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
                      "Login with Google",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignupScreenUI(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                    children: const [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF001233),
                        ),
                      ),
                    ],
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
