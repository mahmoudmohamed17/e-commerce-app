import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/supabase_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/views/auth/logic/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var supabase = SupabaseService();
  UserModel? userData;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await supabase.login(email: email, password: password);
    if (result) {
      await getUserData();
      emit(LoginSuccess());
    } else {
      emit(LoginFailure(message: 'Login failed'));
    }
  }

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    try {
      await supabase.signup(email: email, password: password, name: name);
      await addUserData(name: name, email: email);
      await getUserData();
      emit(SignupSuccess());
    } on AuthException catch (e) {
      log('Signup error: ${e.message}');
      emit(SignupFailure(message: e.message));
    } catch (e) {
      emit(SignupFailure(message: e.toString()));
    }

    // if (result) {
    //   await addUserData(name: name, email: email);
    //   await getUserData();
    //   emit(SignupSuccess());
    // } else {
    //   emit(SignupFailure(message: 'Signup failed'));
    // }
  }

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    var result = await supabase.signInWithGoogle();
    if (result == null) {
      emit(GoogleSignInFailure(message: 'Google Sign In failed'));
      return;
    } else {
      await addUserData(name: result.displayName ?? '', email: result.email);
      await getUserData();
      emit(GoogleSignInSuccess());
    }
  }

  Future<void> signout() async {
    emit(SignOutLoading());
    var result = await supabase.signOut();
    if (result) {
      emit(SignOutSuccess());
    } else {
      emit(SignOutFailure(message: 'Sign Out failed'));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(PasswordResetLoading());
    var result = await supabase.resetPassword(email: email);
    if (result) {
      emit(PasswordResetSuccess());
    } else {
      emit(PasswordResetFailure(message: 'Password reset failed'));
    }
  }

  Future<void> addUserData({
    required String name,
    required String email,
  }) async {
    await supabase.addUserData(
      table: AppConstants.usersTable,
      data: {
        'user_id': SupabaseService.supabaseClient.auth.currentUser?.id,
        'user_name': name,
        'user_email': email,
        'created_at': DateTime.now().toIso8601String(),
      },
    );
  }

  Future<void> getUserData() async {
    emit(UserDataLoading());
    var result = await supabase.getUserData();
    if (result != null) {
      log('User data: ${result.toJson()}');
      userData = result;
      emit(UserDataSuccess(userData: result));
    } else {
      emit(UserDataFailure(message: 'Failed to get user data'));
    }
  }

  /// For any updates not related to the primary ones
  void update() {
    emit(AuthInitial());
  }
}
