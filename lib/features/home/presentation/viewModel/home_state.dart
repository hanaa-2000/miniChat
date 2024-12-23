part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class UploadImageLoading extends HomeState {}

final class UploadImageSuccess extends HomeState {
  final String imageUrl;

  UploadImageSuccess({required this.imageUrl});
}
class EditModeEnabled extends HomeState {
  final bool isEditing;
  EditModeEnabled({required this.isEditing});
}

final class UploadImageFailure extends HomeState {
  final String msgError;

  UploadImageFailure({required this.msgError});
}


class UpdateProfileLoading extends HomeState {}
class UpdateProfileSuccess extends HomeState {}
class UpdateProfileFailure extends HomeState {
  final String msgError;
  UpdateProfileFailure({required this.msgError});
}

class UserDataLoading extends HomeState {}
class UserDataSuccess extends HomeState {
  final List<UserModel> filteredUsers;

  UserDataSuccess(this.filteredUsers);
}

class UserDataFailure extends HomeState {
  final String msgError;
  UserDataFailure({required this.msgError});
}
class GroupSearchLoading extends HomeState {}
class GroupSearchSuccess extends HomeState {
  final List<Map<String, dynamic>> groups;

  GroupSearchSuccess(this.groups);
}
class GroupSearchReset extends HomeState {}

class GroupSearchFailure extends HomeState {
  final String msgError;
  GroupSearchFailure({required this.msgError});
}



