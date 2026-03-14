// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:ecommerce_udemy/core/data/exceptions/exceptions.dart';
//
// class FireBaseAuthHelper {
//   static FirebaseAuth get _auth => FirebaseAuth.instance;
//   static User? get user=>_auth.currentUser;
//
//   static Future<User?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//       final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       final user = await _auth.signInWithCredential(credential);
//       return user.user;
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static Future<User?> createUserWithEmailAndPassword(
//       {required String email, required String password}) async {
//     try {
//       final result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } on FirebaseException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       } else{
//         print('Can\'t Create Your Account, Try Again Later');
//       }
//       throw AppException(e.toString());
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static Future<User?> signInWithEmailAndPassword(
//       {required String email, required String password}) async {
//     try {
//       final result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return result.user;
//     } on FirebaseException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//       else{
//         print('Wrong password Or email');
//       }
//       throw AppException(e.code);
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//   ///[checkEmail] Return false if email is not in use
//   static Future<bool> checkEmail(String email) async {
//     try {
//       final list = await _auth.fetchSignInMethodsForEmail(email);
//       if (list.isNotEmpty) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (error) {
//       return false;
//     }
//   }
// }
