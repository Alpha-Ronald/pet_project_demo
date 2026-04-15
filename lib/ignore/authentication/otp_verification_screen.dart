import 'package:flutter/material.dart';
class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({super.key,  required this.email});


   final String email;
  //
  // OtpVerificationScreen({super.key, required this.email});

  final TextEditingController otpController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Enter OTP sent to $email",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "OTP",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                String otp = otpController.text;

                // For now, just show success
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("OTP Entered: $otp")),
                );
              },
              child: const Text("Verify OTP"),
            ),
            SizedBox(height: 20),

            Container(
             decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/test_image.jpg"),
            )

          ],
        ),
      ),
    );
  }
}



