import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

final FirebaseAuth _auth = FirebaseAuth.instance;

//Signup
Future<User?> signUp(String email, String password) async {
  final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  await cred.user!.sendEmailVerification();
  return cred.user;
}
}