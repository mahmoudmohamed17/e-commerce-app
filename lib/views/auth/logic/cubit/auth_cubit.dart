import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/utils/api_strings.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var supabase = Supabase.instance.client;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      await supabase.auth.signInWithPassword(password: password, email: email);
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
      await supabase.auth.signUp(password: password, email: email);
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
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: ApiStrings.appAndroidClientId,
      serverClientId: ApiStrings.appWebClientId,
    );
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;
    if (accessToken == null || idToken == null) {
      emit(
        GoogleSignInFailure(
          message: 'There is an error fetching some credentials',
        ),
      );
    }
    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken!,
      accessToken: accessToken,
    );
    emit(GoogleSignInSuccess());

    // final result = await supabase.auth.signInWithOAuth(
    //   OAuthProvider.google,
    //   authScreenLaunchMode: LaunchMode.externalNonBrowserApplication,
    // );
    // if (result) {
    //   emit(GoogleSignInSuccess());
    // } else {
    //   emit(
    //     GoogleSignInFailure(
    //       message: 'There is an error fetching some credentials',
    //     ),
    //   );
    // }
  }

  // For any updates not related to the primary ones, like
  // for text fields
  void update() {
    emit(AuthInitial());
  }
}
