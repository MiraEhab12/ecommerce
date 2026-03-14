// import 'package:ecommerce_udemy/core/data/exceptions/exceptions.dart';
// import 'package:ecommerce_udemy/utils/extentions/extention.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class FireBaseDataBaseHelper {
//   static final _firebaseDB = FirebaseDatabase.instance;
//
//   static set({required String path, required Map<String, dynamic> data}) async {
//     try {
//       DatabaseReference dB = _firebaseDB.ref(path);
//       await dB.set(data);
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static update(
//       {required String path, required Map<String, dynamic> data}) async {
//     try {
//       DatabaseReference dB = _firebaseDB.ref(path);
//
//       await dB.update(data);
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static delete({required String path}) async {
//     try {
//       DatabaseReference dB = _firebaseDB.ref(path);
//
//       await dB.remove();
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static Stream<DatabaseEvent> listen(
//       {required String path, String? orderByChild}) {
//     try {
//       DatabaseReference dB = _firebaseDB.ref(path);
//       return orderByChild != null
//           ? dB.orderByChild(orderByChild).onValue
//           : dB.onValue;
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static Future<Map<String, dynamic>?> get(
//       {required String path,
//         String? orderByChild,
//         String? equalTo,
//         String? key}) async {
//     try {
//       DatabaseReference dB = _firebaseDB.ref(path);
//
//       final snapshot = orderByChild != null
//           ? await dB.orderByChild(orderByChild).get()
//           : equalTo != null
//           ? await dB.orderByChild(key ?? "").equalTo(equalTo).get()
//           : await dB.get();
//       final value = snapshot.value;
//
//       if (value != null) {
//         return value.toMapJson;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static Stream<DatabaseEvent> stream(
//       {required String path, String? orderByChild}) {
//     try {
//       DatabaseReference dB = _firebaseDB.ref(path);
//       return orderByChild != null
//           ? dB.orderByChild(orderByChild).onValue
//           : dB.onValue;
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
//
//   static Future<List<Map<String, dynamic>>> getList(
//       {required String path,
//         String? orderByChild,
//         int? limit,
//         String? equalTo,
//         String? key}) async {
//     try {
//       DatabaseReference dB = _firebaseDB.ref(path);
//       final snapshot = orderByChild != null
//           ? await dB.orderByChild(orderByChild).get()
//           : limit != null
//           ? await dB.limitToLast(limit).get()
//           : equalTo != null
//           ? await dB.orderByChild(key ?? "").equalTo(equalTo).get()
//           : await dB.get();
//
//       return snapshot.children.map<Map<String, dynamic>>((e) {
//         return e.value?.toMapJson ?? {};
//       }).toList();
//     } catch (e) {
//       throw AppException(e.toString());
//     }
//   }
// }
