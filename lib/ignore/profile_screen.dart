// import 'package:flutter/material.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( //Scaffold is our screen wrapper that provides the foundational layout needed
//
//       appBar: AppBar(
//         leading: const BackButton(
//           color: Colors.white,
//           style: ButtonStyle(),
//         ),
//         backgroundColor: Colors.blueAccent,
//         title: const Text(
//           'Profile Info',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         elevation: 4,
//         shadowColor: Colors.black,
//       ),
//
//       body: Padding(     //This padding creates a gap on the right and left side of the screen
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Center( //Centralizes all contents in the center
//             child: Column( //Major Column that controls the size of the screen
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //The major column contains 1. The users details 2. The button
//               children: [
//                 Expanded(
//                   child: SingleChildScrollView( // To ensure scrollable content
//                     child: Column( //This second column contains all the users details(Circle avatar, up to the two containers containing role and location)
//
//                       children: [
//                         const SizedBox(
//                           height: 30,
//                         ),
//
//                         const CircleAvatar(
//                           radius: 70,
//                           backgroundImage: AssetImage("assets/my_picture.jpg"),
//                         ),
//
//
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           'Ronald Adewoye',
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 4,
//                         ),
//                         const Text(
//                           'Flutter Developer',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.grey,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFEAF1FF),
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                           child: Column(children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Email:',
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   width: 40,
//                                 ),
//                                 Text('ronald@example.com'),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 8.0),
//                               child: Divider(),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Location:',
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   width: 40,
//                                 ),
//                                 Text('Lagos, Nigeria'),
//                               ],
//                             ),
//                           ]),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.greenAccent.withOpacity(0.3),
//                             borderRadius: BorderRadius.circular(14),
//                           ),
//                           child: Column(children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Role:',
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   width: 40,
//                                 ),
//                                 Text('Flutter Developer'),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 8.0),
//                               child: Divider(),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Location:',
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(
//                                   width: 40,
//                                 ),
//                                 Text('Lagos, Nigeria'),
//                               ],
//                             ),
//                           ]),
//                         ),
//                         SizedBox(height: 35,)
//
//                       ],
//                     ),
//                     //This is the end of the second Column
//                     //And you can notice it is wrapped in a SingleChildScrollView and an Expanded Widget
//
//
//                   ),
//                 ),
//
//                 //The container below contains the button, The container is only used to give the button a height and width
//                 Container(
//                   height: 52,
//                   width: double.maxFinite,
//
//                   //All other decorations of the button are done wthin the Elevated Button widget
//                   child: ElevatedButton(
//
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF4A7FEF),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: Text(
//                         "Edit Profile",
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 )
//
//               ],
//             ),
//           )),
//     );
//   }
// }
