import 'package:e_commerce_app/core/utils/api_strings.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static var supabaseClient = Supabase.instance.client;

  Future<bool> login(String email, String password) async {
    try {
      await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signup(String email, String password) async {
    try {
      await supabaseClient.auth.signUp(password: password, email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: ApiStrings.appAndroidClientId,
      serverClientId: ApiStrings.appWebClientId,
    );
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return false;
    }
    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;
    if (accessToken == null || idToken == null) {
      return false;
    }
    await supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    await addData(AppConstants.usersDatabaseTable, {
      'id': googleUser.id,
      'name': googleUser.displayName,
      'email': googleUser.email,
      'created_at': DateTime.now().toIso8601String(),
    });
    return true;
  }

  Future<bool> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await supabaseClient.auth.resetPasswordForEmail(email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> addData(String table, Map<String, dynamic> data) async {
    await supabaseClient.from(table).upsert(data);
  }
}
