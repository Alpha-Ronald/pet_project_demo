
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String resultMessage = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(016, 20, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 60,),
              Text(
                "Glad you're here",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D2D2D),
                ),
              ),


              SizedBox(height: 20),
              Expanded(child:  Center(
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),


                    /////
                    SizedBox(
                      width: 358,
                      height: 72,
                      child:  TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText:  false,
                        enabled: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Color(0xFF001233)),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                          suffixIcon:
                              IconButton(
                            icon: Icon(
                               Icons.visibility_off ,
                              color: Colors.grey.shade600,
                            ),
                            onPressed: () {

                            },
                          )

                        ),
                      ),

                    ),

                    SizedBox(height: 20,),

                    SizedBox(
                      width: 358,
                      height: 72,
                      child:  TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText:  false,
                        enabled: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Email",
                            labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Color(0xFF001233)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                            suffixIcon:
                            IconButton(
                              icon: Icon(
                                Icons.visibility_off ,
                                color: Colors.grey.shade600,
                              ),
                              onPressed: () {


                              },
                            )

                        ),
                      ),

                    ),




                    Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: (){ },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            )),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding:  EdgeInsets.only(left:16.0,right: 16),
                      child: SizedBox(
                        width: 358,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF001233),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color:Color(0xFFFFBF00), width: 1),
                            ),
                            // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h), // Adjust spacing
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )

                    ),

                    SizedBox(height: 24),


                    Padding(
                      padding:EdgeInsets.only(left: 16, right:16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey[300],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Or",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24),

                    Padding(
                      padding:  EdgeInsets.only(left:16,right: 16),
                      child:  SizedBox(
                        width: 358,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color:Color(0xFFFFBF00), width: 1),
                            ),
                            // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h), // Adjust spacing
                          ),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.g_translate, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                "Login with Google",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )

                    ),

                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color:  Color(0xFF001233)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),), // The main screen content
            ],
          ),
        ),
      ),
    );

















  }
}
