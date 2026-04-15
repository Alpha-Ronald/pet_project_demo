import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SIGN UP
  Future<User?> signUp(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await cred.user!.sendEmailVerification();

    return cred.user;
  }

  // LOGIN
  Future<User?> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return cred.user;
  }

  // CHECK VERIFIED
  Future<bool> isEmailVerified() async {
    await _auth.currentUser?.reload();
    return _auth.currentUser?.emailVerified ?? false;
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  // CURRENT USER
  User? get currentUser => _auth.currentUser;
}