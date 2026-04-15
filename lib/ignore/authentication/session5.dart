import 'package:flutter/material.dart';

class Session5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: SafeArea(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

          Padding(
            padding: const EdgeInsets.all( 10.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.red,
                    child: Center(child: Text("Box 1")),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.red,
                    margin: EdgeInsets.only(right: 10),
                    child: Center(child: Text("Box 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.red,
                    margin: EdgeInsets.only(right: 10),
                    child: Center(child: Text("Box 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    color: Colors.red,
                    child: Center(child: Text("Box 1")),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 120,
            margin: EdgeInsets.all(10),
            color: Colors.orange,
            child: Center(
              child: Text(
                "Long Container Below",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
                ],
              ),
        ));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My First App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            color: Colors.blue,
            height: 80,
            width: 200,
            child: Center(
                child: Text(
              'Ronald',
              style: TextStyle(fontSize: 25),
            )),
          ),
        ));
  }
}
