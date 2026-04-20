import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/auth/sign_up.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("✅ Firebase initialized successfully");
  } catch (e) {
    print("❌ Firebase init failed: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demoo',
          theme: ThemeData(
            primaryColor: Colors.red,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          ),
          home: SignupScreenUI(),
        );
      },
    );
  }
}








//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//
//       body: Center(
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 100,
//                 decoration:
//                     BoxDecoration(color: Colors.red, shape: BoxShape.rectangle),
//                 child: Column(
//                   children: [
//                     // Text('data'),  Text('data'),  Text('data'),  Text('data'),  Text('data'),
//                   ],
//                 ),
//               ),
//             ),
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
// class FirstClass extends StatefulWidget {
//   const FirstClass({super.key});
//
//   @override
//   State<FirstClass> createState() => _FirstClassState();
// }
//
// class _FirstClassState extends State<FirstClass> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.scale),
//           title: Text('data'),
//           centerTitle: true,
//           actions: [Icon(Icons.foggy)],
//         ),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('data'),
//             Container(
//               child: Text('data'),
//             ),
//             ElevatedButton(onPressed: () {}, child: Text('data')),
//             ElevatedButton(onPressed: () {}, child: Text('data'))
//           ],
//         )));
//   }
// }
//
// class Page1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('Page1'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//
//             children: [
//               Text('This is a represntation of the Column Widget',style: TextStyle(fontSize: 20),),
//
//               SizedBox(height: 15,),
//
//               Container(
//                 height: 150,
//                 width: 300,
//                 decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//               ),
//               SizedBox(height: 15,),
//
//               Container(
//                 height: 150,
//                 width: 300,
//                 decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
//
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('data'),
//                     Text('data'),
//                    Container(
//                      height: 20,
//                      width: 20,
//                      color: Colors.black,
//                    )
//                   ]
//                 ),
//               ),
//
//               SizedBox(height: 15,),
//
//               Container(
//                 height: 150,
//                 width: 300,
//                 decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
//
//               ),
//               SizedBox(height: 15,),
//
//
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(width: 10,),
//                     Container(
//                       height: 150,
//                       width: 100,
//                       decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
//
//                     ),
//                     SizedBox(width: 10,),
//                     Container(
//                       height: 150,
//                       width: 100,
//                       decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//
//                     ),
//                     SizedBox(width: 10,),
//
//                     Container(
//                       height: 150,
//                       width: 100,
//                       decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
//
//                     ),
//                     SizedBox(width: 10,),
//
//                     Container(
//                       height: 150,
//                       width: 100,
//                       decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
//
//                     ),
//                     SizedBox(width: 10,),
//
//                     Container(
//                       height: 150,
//                       width: 100,
//                       decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
//
//                     ),
//                 SizedBox(width: 10,)
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 15,),
//
//               Container(
//                 height: 150,
//                 width: 300,
//                 decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
//
//               ),
//               SizedBox(height: 15,),
//
//               Container(
//                 height: 150,
//                 width: 300,
//                 decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
//
//               ),
//               SizedBox(height: 15,),
//
//               Container(
//                 height: 150,
//                 width: 300,
//                 decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
//
//               ),
//
//
//
//
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }
//
//
//
