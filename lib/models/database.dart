import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(String userId, Map<String,dynamic> userInfoMap){
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }
  Future<DocumentSnapshot> getUserFromDB(String userID){
    return FirebaseFirestore.instance.collection("users").doc(userID).get();
  }
}