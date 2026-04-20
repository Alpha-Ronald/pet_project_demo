import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Signup
  Future<User?> signUp(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await cred.user!.sendEmailVerification();
    return cred.user;
  }

//Login
  Future<User?> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return cred.user;
  }

//Email verified
Future<bool> isEmailVerified() async{
    await _auth.currentUser?.reload();
    return _auth.currentUser?.emailVerified ?? false;
}

//Reset password
  Future<void> resetPassword(String email) async{
    await _auth.sendPasswordResetEmail(email: email);


  }

  User? get currentUser => _auth.currentUser;




}
