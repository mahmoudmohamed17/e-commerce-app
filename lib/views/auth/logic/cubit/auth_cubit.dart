import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var client = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(password: password, email: email);
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
      await client.auth.signUp(password: password, email: email);
      emit(SignupSuccess());
    } on AuthException catch (e) {
      log('Error with AuthException: ${e.toString()}');
      emit(SignupFailure(message: e.message));
    } catch (e) {
      emit(SignupFailure(message: e.toString()));
    }
  }

  // For any updates not related to the primary ones, like
  // for text fields
  void update() {
    emit(AuthInitial());
  }
}
