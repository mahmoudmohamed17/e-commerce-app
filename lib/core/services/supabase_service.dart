import 'package:e_commerce_app/core/utils/api_strings.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static var supabaseClient = Supabase.instance.client;

  Future<void> login(String email, password) async {
    await supabaseClient.auth.signInWithPassword(password: password, email: email);
  }

  Future<void> signup(String email, password) async {
    await supabaseClient.auth.signUp(password: password, email: email);
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
    return true;
  }

  Future<void> signOut() async {
    await supabaseClient.auth.signOut();
  }

  Future<void> resetPassword(String email) async {
    await supabaseClient.auth.resetPasswordForEmail(email);
  }

  Future<void> addData(String table, Map<String, dynamic> data) async {
    await supabaseClient.from(table).insert(data);
  }
}
