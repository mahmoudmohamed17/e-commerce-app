import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/services/supabase_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var supabase = SupabaseService();

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await supabase.login(email, password);
    if (result) {
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
    var result = await supabase.signup(email, password);
    if (result) {
      await addUserData(name, email);
      emit(SignupSuccess());
    } else {
      emit(SignupFailure(message: 'Signup failed'));
    }
  }

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
    var result = await supabase.signOut();
    if (result) {
      emit(SignOutSuccess());
    } else {
      emit(SignOutFailure(message: 'Sign Out failed'));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(PasswordResetLoading());
    var result = await supabase.resetPassword(email);
    if (result) {
      emit(PasswordResetSuccess());
    } else {
      emit(PasswordResetFailure(message: 'Password reset failed'));
    }
  }

  Future<void> addUserData(String name, String email) async {
    await supabase.addData(AppConstants.usersDatabaseTable, {
      'id': SupabaseService.supabaseClient.auth.currentUser?.id,
      'name': name,
      'email': email,
      'created_at': DateTime.now().toIso8601String()
    });
  }

  /// For any updates not related to the primary ones
  void update() {
    emit(AuthInitial());
  }
}
