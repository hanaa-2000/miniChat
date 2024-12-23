import 'dart:io';

import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/home/presentation/data/model/user_model.dart';

class HomeServices {
  Future<String> uploadProfileImage(String userId, XFile imageFile) async
  {
    String imagePath = 'users/$userId/profile_image.png';
    final ref = storage.ref().child(imagePath);
    await ref.putFile(File(imageFile.path));
    String imageUrl = await ref.getDownloadURL();

      return imageUrl ;
  }


  // Future<Map<String, dynamic>> getUserData() async {
  //   DocumentSnapshot userDoc = await firebaseFirestore.collection(userCollection).doc().get();
  //   return userDoc.data() as Map<String, dynamic>;
  // }
  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await firebaseFirestore.collection(userCollection).get();
    return snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
  }

}