


import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';



class StorageService{
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfileImage({required String uid, required File file}) async{
    try{
      final time = DateTime.now().millisecondsSinceEpoch;
      final ref = _storage.ref().child('profile_images').child("$uid$time.jpg");

      await ref.putFile(file);

      final downloadUrl = await ref.getDownloadURL();

      return downloadUrl;
    }catch(e){
      print(e);
      throw Exception('Image upload failed');
    }

  }
}