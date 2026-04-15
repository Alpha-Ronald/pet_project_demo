
import 'package:flutter/material.dart';

import 'otp_verification_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Enter your email to receive an OTP",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                String email = emailController.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OtpVerificationScreen(email : email), //email: email
                  ),
                );
              },
              child: const Text("Send OTP"),
            )
          ],
        ),
      ),
    );
  }
}