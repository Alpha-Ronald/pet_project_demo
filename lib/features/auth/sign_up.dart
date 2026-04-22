import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/auth/log_in.dart';
import 'package:untitled/services/auth_service.dart';

import '../../services/user_service.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_textfield.dart';



class SignupScreenUI extends StatefulWidget {
   SignupScreenUI({super.key});

  @override
  State<SignupScreenUI> createState() => _SignupScreenUIState();
}

class _SignupScreenUIState extends State<SignupScreenUI> {
  final emailController = TextEditingController();

   final passwordController = TextEditingController();
   final confirmPasswordController =TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();


  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      mainText: 'Glad to have you',
      subText: 'here!',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldUI(label: "Full name", controller: nameController),
            CustomTextFieldUI(label: "Email",controller: emailController,),
            CustomTextFieldUI(label: "Address", controller: addressController,),

            CustomTextFieldUI(label: "Password", isPassword: true, controller: passwordController,),
            CustomTextFieldUI(label: "Confirm Password", isPassword: true, controller: confirmPasswordController,),


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

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GestureDetector(
                onTap: isLoading ? null : () async {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final confirmPassword = confirmPasswordController.text.trim();
                  final name = nameController.text.trim();
                  final address = addressController.text.trim();


                  if(password != confirmPassword){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Passwords do not match')));
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                   try{
                    print("Creating account with $email & $password");
                    final user = await AuthService().signUp(email, password);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Verification email sent')));

                    if(user != null){

                      await UserService().createUser(uid: user.uid, email: email, name: name, address: address

                  );
                      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreenUI()));

                    }

                   }catch(e){

                    String message = "Signup failed";
                    print(e.toString());
                    print(e);


                    if (e.toString().contains("email-already-in-use")){
                      message = "Email already in use";

                    }

                    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:  Text(message)));

                   }finally{
                     setState(() {
                       isLoading = false;
                     });

                   }





                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => const LoginScreenUI(),
                  //   ),
                  // );
                },
                child: Container(
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF001233),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: isLoading? CircularProgressIndicator(color: Colors.white,): Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
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

            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  LoginScreenUI(),
                    ),
                  );
                },
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
            ),

            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}