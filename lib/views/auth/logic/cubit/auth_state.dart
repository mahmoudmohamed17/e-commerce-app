part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});
}

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailure extends AuthState {
  final String message;

  SignupFailure({required this.message});
}

final class GoogleSignInLoading extends AuthState {}

final class GoogleSignInSuccess extends AuthState {}

final class GoogleSignInFailure extends AuthState {
  final String message;

  GoogleSignInFailure({required this.message});
}

final class SignOutLoading extends AuthState {}

final class SignOutSuccess extends AuthState {}

final class SignOutFailure extends AuthState {
  final String message;

  SignOutFailure({required this.message});
}

final class PasswordResetLoading extends AuthState {}

final class PasswordResetSuccess extends AuthState {}

final class PasswordResetFailure extends AuthState {
  final String message;

  PasswordResetFailure({required this.message});
}

final class UserDataLoading extends AuthState {}

final class UserDataSuccess extends AuthState {
  final UserModel userData;

  UserDataSuccess({required this.userData});
}

final class UserDataFailure extends AuthState {
  final String message;

  UserDataFailure({required this.message});
}
