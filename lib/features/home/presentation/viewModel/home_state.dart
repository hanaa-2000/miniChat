part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailure extends HomeState {
  final String msgError;

  HomeFailure({required this.msgError});
}
final class UploadImageLoading extends HomeState {}

final class UploadImageSuccess extends HomeState {}

final class UploadImageFailure extends HomeState {
  final String msgError;

  UploadImageFailure({required this.msgError});
}

