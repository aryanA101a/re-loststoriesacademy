// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthFunctions {
//   login({email, password}) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

//   verifyEmail(c, user) {
//     // print(user);
//     user.reload();
//     if (!user.emailVerified) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   Future<UserCredential> signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     // Create a new credential
//     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }

//   Future<UserCredential> signInWithFacebook() async {
//     // Trigger the sign-in flow
//     try {
//       final AccessToken result = await FacebookAuth.instance.login();

//       // Create a credential from the access token
//       final FacebookAuthCredential facebookAuthCredential =
//           FacebookAuthProvider.credential(result.token);

//       // Once signed in, return the UserCredential
//       return await FirebaseAuth.instance
//           .signInWithCredential(facebookAuthCredential);
//     } catch (e) {
//       print(e.message);
//     }
//   }

//   logout() async {
//     await FirebaseAuth.instance.signOut();
//   }
// }
