import 'package:flutter/material.dart';

import 'main.dart';


class DEMO extends StatefulWidget{
  const DEMO({super.key});

  @override
  State<DEMO> createState() => _DEMOState();
}

class _DEMOState extends State<DEMO> {

  bool isObscure = false;
  bool colorBright = true;
  final TextEditingController passwordController = TextEditingController();

  String data = 'Money';
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Toggle Password Visibility")),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: passwordController,
                obscureText: isObscure, // Controls visibility
                decoration: InputDecoration(
                  labelText: "Password",
                suffixIcon: IconButton(onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                  icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility ),)
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: colorBright ? Colors.red: Colors.blue),
                onPressed: (){
                  setState(() {
                    colorBright = !colorBright;
                    data = passwordController.text;
                  });
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title:  data)));
                }, child: Text('change color'), )
            ],
          ),
        ),
      ),
    );
  }
}


//  suffixIcon: IconButton(
//                 icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
//                 onPressed: () {
//                   setState(() {
//                     isObscure = !isObscure;
//                   });
//                 },
//               ),