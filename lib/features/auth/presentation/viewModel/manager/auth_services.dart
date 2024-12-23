import 'package:firebase_auth/firebase_auth.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';

class AuthServices {
  Future<UserCredential> registerUser(
      {required String email, required String password}) async {
    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> loginUser(
      {required String email, required String password}) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  saveDataUser(
      {required String name, required String email, required String phone, required String uid,}) async {
    await firebaseFirestore.collection(userCollection).doc(uid).set({
      'name':name,
      "phone":phone,
      "email":email,
      "profileImage":""
    });

  }

}
