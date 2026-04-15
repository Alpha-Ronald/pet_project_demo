import 'package:flutter/material.dart';

class Session7 extends StatefulWidget {
  const Session7({super.key});

  @override
  State<Session7> createState() => _Session7State();
}

class _Session7State extends State<Session7> {
  bool isPasswordVisible = false;

  String resultMessage = '';

  bool isSuccesful = false;


  IconData icon = Icons.vibration;







  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    Color resultColor = isSuccesful? Colors.green : Colors.red;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Glad you're back",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              SizedBox(
                height: 80,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 360,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        TextField(
                          controller: emailController ,

                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text('Email'),
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: passwordController,

                          obscureText: isPasswordVisible? true: false,

                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              label: Text('Password'),
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),

                              suffixIcon: IconButton(

                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },

                                icon: isPasswordVisible? Icon(
                                  Icons.visibility_rounded
                                ) : Icon (Icons.visibility_off),
                              )),
                        ),


                        SizedBox(
                          height: 10,
                        ),

                        Text(resultMessage, style: TextStyle(color: resultColor,fontSize: 15),),

                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          width: 360,
                          height: 55,
                          child: ElevatedButton(
                              onPressed: () {
                                String email = emailController.text;
                                String password = passwordController.text;
                                setState(() {
                                  if(email.isEmpty && password.isEmpty){
                                    resultMessage = 'Please enter Login details';                                  }


                                  else if(email.isEmpty){
                                    resultMessage = 'Please enter email ';
                                  }
                                  else if(password.isEmpty){
                                    resultMessage = 'Please enter password';
                                  }
                                  else{
                                    isSuccesful = true;
                                  }
                                });


                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF001233),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side:
                                          BorderSide(color: Color(0xFFFBF00)))),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            )),
                            SizedBox(
                              width: 12,
                            ),
                            Text('OR'),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                                child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(color: Colors.yellow))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.g_translate,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Login with Google',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              children: [
                                TextSpan(text: "Sign up", style: TextStyle())
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
