import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/supabase_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var supabase = SupabaseService();

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      supabase.login(email, password);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      log('Error with AuthException: ${e.toString()}');
      emit(LoginFailure(message: e.message));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> signup(String email, String password) async {
    emit(SignupLoading());
    try {
      supabase.signup(email, password);
      emit(SignupSuccess());
    } on AuthException catch (e) {
      log('Error with AuthException: ${e.toString()}');
      emit(SignupFailure(message: e.message));
    } catch (e) {
      emit(SignupFailure(message: e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;
  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    var result = await supabase.signInWithGoogle();
    if (result) {
      emit(GoogleSignInSuccess());
    } else {
      emit(GoogleSignInFailure(message: 'Google Sign In failed'));
    }
  }

  Future<void> signout() async {
    emit(SignOutLoading());
    try {
      supabase.signOut();
      emit(SignOutSuccess());
    } on AuthException catch (e) {
      log('Error with AuthException: ${e.toString()}');
      emit(SignOutFailure(message: e.message));
    } catch (e) {
      emit(SignOutFailure(message: e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(PasswordResetLoading());
    try {
      supabase.resetPassword(email);
      emit(PasswordResetSuccess());
    } on AuthException catch (e) {
      log('Error with AuthException: ${e.toString()}');
      emit(PasswordResetFailure(message: e.message));
    } catch (e) {
      emit(PasswordResetFailure(message: e.toString()));
    }
  }

  /// For any updates not related to the primary ones
  void update() {
    emit(AuthInitial());
  }
}
