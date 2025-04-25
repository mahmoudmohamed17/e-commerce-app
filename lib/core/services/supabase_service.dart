import 'package:e_commerce_app/core/utils/api_strings.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/views/auth/logic/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final supabaseClient = Supabase.instance.client;

  Future<bool> login({required String email, required String password}) async {
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

  Future<AuthResponse?> signup({
    required String email,
    required String password,
  }) async {
    var response = await supabaseClient.auth.signUp(
      password: password,
      email: email,
    );
    return response;
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: ApiStrings.appAndroidClientId,
      serverClientId: ApiStrings.appWebClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final accessToken = googleAuth?.accessToken;
    final idToken = googleAuth?.idToken;
    if (accessToken == null || idToken == null) {
      return null;
    }
    await supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    return googleUser;
  }

  Future<bool> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetPassword({required String email}) async {
    try {
      await supabaseClient.auth.resetPasswordForEmail(email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> addUserData({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    await supabaseClient.from(table).upsert(data);
  }

  Future<UserModel?> getUserData() async {
    final response = await supabaseClient
        .from(AppConstants.usersTable)
        .select()
        .eq('user_id', supabaseClient.auth.currentUser!.id);
    return UserModel.fromJson(response[0]);
  }
}
