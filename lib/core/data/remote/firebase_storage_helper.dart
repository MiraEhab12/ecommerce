// import 'dart:io';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';
//
// class FirebaseStorageHelper {
//   static final storageRef = FirebaseStorage.instance.ref();
//
//   static Future<String> uploadFile(String path,File file) async {
//     final store = storageRef.child("$path/${basename(file.path)}");
//     await store.putFile(file);
//     return await store.getDownloadURL();
//   }
//   static  deleteFile(String url) async {
//     try{
//       await FirebaseStorage.instance.refFromURL(url).delete();
//     }catch(e){
//       return;
//     }
//   }
// }
