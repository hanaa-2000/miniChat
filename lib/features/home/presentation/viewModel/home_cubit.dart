import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:minichat_project/core/constants/firebase_consts.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  uploadProfileImage({
    required String userId,
    required ImageSource source,
  }) async {
    try {
      emit(UploadImageLoading());

        final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image == null) {
        emit(UploadImageFailure(msgError: 'No image selected.'));
        return;
      }

      String imagePath = 'users/$userId/profile_image.png';
      final ref = FirebaseStorage.instance.ref(imagePath);
      await ref.putFile(File(image.path));
      String imageUrl = await ref.getDownloadURL();

      await firebaseFirestore.collection(userCollection).doc(userId).update({
        'profileImageUrl': imageUrl,
      });

      emit(UploadImageSuccess());
    } catch (e) {
      emit(UploadImageFailure(msgError: e.toString()));
    }
  }
}







