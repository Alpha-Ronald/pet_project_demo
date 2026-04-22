import 'package:cloud_firestore/cloud_firestore.dart';

class UserService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser ({required String uid, required String email, required String name, required String address}) async{
    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'name': name,
      'address': address,
      "createdAt": FieldValue.serverTimestamp()
    });

  }

  Future<Map<String, dynamic>?> getUser(String uid) async{

    final doc = await _firestore.collection('users').doc(uid).get();

    if(doc.exists){
      return doc.data();
    }
    return null;


  }







}