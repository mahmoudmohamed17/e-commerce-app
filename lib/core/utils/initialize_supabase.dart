import 'package:e_commerce_app/core/utils/api_strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initializeSupabase() async {
  await Supabase.initialize(
    url: ApiStrings.myProjectUrl,
    anonKey: ApiStrings.myAPiKey,
  );
}
