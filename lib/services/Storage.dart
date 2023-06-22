import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

}