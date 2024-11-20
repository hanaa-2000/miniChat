
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/auth/presentation/viewModel/manager/auth_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authServices) : super(AuthInitial());
 final  AuthServices _authServices;

  registerUser({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await _authServices.registerUser(email: email, password: password);

      _authServices.saveDataUser(name: name, email: email, phone: phone, uid:userCredential.user!.uid);
      // firebaseFirestore.collection(userCollection).doc(userCredential.user!.uid).set({
      //   'name':name,
      //   "phone":phone,
      //   "email":email
      // });
     await getUserData();
     emit(RegisterSuccess());
    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        emit(RegisterFailure(
            'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            'The account already exists for that email.'));
      }
    }on Exception catch(e){
      emit(RegisterFailure(e.toString()));
    }
  }

  loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await _authServices.loginUser(email: email, password: password);
      await getUserData();
      emit(LoginSuccess());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure("user-not-found"));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('wrong-password'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure('invalid-email'));
      } else if (e.code == 'user-disabled') {
        emit(LoginFailure('user-disabled'));
      } else if (e.code == 'too-many-requests') {
        emit(LoginFailure('too-many-requests'));
      } else {
        emit(LoginFailure('Something went wrong.'));
      }
    } on Exception catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }


  getUserData()async{

    if (currentUser != null) {
      final userData = await firebaseFirestore
          .collection(userCollection)
          .doc(currentUser!.uid)
          .get();
     // currentEmail = user.email??'No Email';
      log(currentUser!.email.toString());
      log(userData.data().toString());
    }


  }

  // logout()async{
  //
  //   try{
  //    await auth.signOut();
  //    emit(LoginSuccess());
  //   }on Exception catch(e){
  //     emit(LoginFailure(e.toString()));
  //   }
  //
  //
  // }

}
