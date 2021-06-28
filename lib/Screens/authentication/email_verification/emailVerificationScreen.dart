// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:loststoriesacademy/Screens/homepage.dart';
// import 'package:loststoriesacademy/repositories/userrepository.dart';
// import 'package:loststoriesacademy/repositories/vanillaDart.dart';

// class EmailVerificationScreen extends StatefulWidget {
//   @override
//   _EmailVerificationScreenState createState() =>
//       _EmailVerificationScreenState();
// }

// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   // AuthFunctions authFunctions = AuthFunctions();
//   UserRepository userRepository = UserRepository();
//   @override
//   void initState() {
//     // TODO: implement initState
//     var user = FirebaseAuth.instance;
//     Timer.periodic(Duration(seconds: 5), (timer) {
//       if (userRepository.verifyEmail(context, auth.currentUser)) {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomePage(),
//             ));
//         timer.cancel();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/logo.png',
              
//             ),
//             Text("Please verify your email!!")
//           ],
//         ),
//       ),
//     );
//   }
// }
