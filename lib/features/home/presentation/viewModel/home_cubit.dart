import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';
import 'package:minichat_project/features/home/presentation/viewModel/home_services.dart';

import '../data/model/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeServices) : super(HomeInitial());

  final HomeServices _homeServices;
  String ?uploadedImageUrl;
  uploadProfileImage({
    required String userId,
    required ImageSource source,
  }) async {
    try {
      emit(UploadImageLoading());
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image == null) {
        emit(UploadImageFailure(msgError: "No image selected."));
        return;
      }

      String imageUrl = await _homeServices.uploadProfileImage(userId, image);
      uploadedImageUrl = imageUrl; // Store the uploaded image URL for later use
      emit(UploadImageSuccess(imageUrl: imageUrl));
    } catch (e) {
      emit(UploadImageFailure(msgError: e.toString()));
    }
  }
  void toggleEditMode(bool isEditing) {
    emit(EditModeEnabled(isEditing: isEditing));
  }

  updateProfile({
    required String userName,
    required String phone,
    required String userId,

  }) async {

    try {
      emit(UpdateProfileLoading());
      await firebaseFirestore.collection(userCollection).doc(userId).update({
        'profileImage': uploadedImageUrl,
        'name': userName,
        "phone": phone,
      });
      emit(UpdateProfileSuccess());
    } catch (e) {
      emit(UpdateProfileFailure(msgError: e.toString()));
    }

  }

  //////////////////search
  void searchUsers(String query) async {
    try {
      emit(UserDataLoading());

      final users = await _homeServices.getAllUsers();

      final filteredUsers = users.where((user) {
        final lowerQuery = query.toLowerCase();
        return user.name.toLowerCase().contains(lowerQuery) ||
            user.phone.toLowerCase().contains(lowerQuery) ||
            user.email.toLowerCase().contains(lowerQuery);
      }).toList();

      if (filteredUsers.isNotEmpty) {
        emit(UserDataSuccess(filteredUsers));
      } else {
        emit(UserDataFailure(msgError: 'No users match your search .'));
      }
    } catch (e) {
      emit(UserDataFailure(msgError: e.toString()));
    }
  }

 void searchGroup(String groupName)async{
    try{
      emit(GroupSearchLoading());

      //final snapshots = await firebaseFirestore.collection(groupCollection).where("groupName",isEqualTo: groupName).get();
      final snapshot = await firebaseFirestore
          .collection(groupCollection)
          .orderBy('groupName')
          .startAt([groupName])
          .endAt(['$groupName\uf8ff'])
          .get();
      if(snapshot.docs.isNotEmpty){
        final groups = snapshot.docs.map((doc) => doc.data(),).toList();
        emit(GroupSearchSuccess(groups));
        print("HHHHHHHHHHHHHHHHHHHHHHH");
      }
    else {
   emit(GroupSearchFailure(msgError: 'No groups found with the name "$groupName".'));
   }
 } catch (error) {
  emit(GroupSearchFailure(msgError: 'Error while searching for groups: $error'));
  }


}


  void resetGroupSearch() {
    emit(GroupSearchReset());
  }

  // Future getUserData() async {
  //   emit(UserDataLoading());
  //   try {
  //     Map<String, dynamic> userData = await _homeServices.getUserData();
  //     return userData;
  //     emit(UserDataSuccess(userData));
  //   } catch (e) {
  //     emit(UserDataFailure(msgError: e.toString()));
  //   }
  // }

// uploadProfileImage({
//   required String userId,
//   required ImageSource source,
// }) async {
//   try {
//     emit(UploadImageLoading());
//
//       final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: source);
//
//     if (image == null) {
//       emit(UploadImageFailure(msgError: 'No image selected.'));
//       return;
//     }
//
//     String imagePath = 'users/$userId/profile_image.png';
//     final ref = FirebaseStorage.instance.ref(imagePath);
//     await ref.putFile(File(image.path));
//     String imageUrl = await ref.getDownloadURL();
//
//     await firebaseFirestore.collection(userCollection).doc(userId).update({
//       'profileImageUrl': imageUrl,
//     });
//
//     emit(UploadImageSuccess());
//   } catch (e) {
//     emit(UploadImageFailure(msgError: e.toString()));
//   }
// }
}
