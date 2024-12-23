part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {}
final class RegisterFailure extends AuthState {
  final String mesError;

  RegisterFailure(this.mesError);
}

final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
final class LoginFailure extends AuthState {

  final String mesError;

  LoginFailure(this.mesError);
}

