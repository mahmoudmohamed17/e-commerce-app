import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initializeSupabase() async {
   await Supabase.initialize(
    url: 'https://pnpejwgmvkzfmmtotlnf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBucGVqd2dtdmt6Zm1tdG90bG5mIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUxMzU3MjEsImV4cCI6MjA2MDcxMTcyMX0.Gizb68SNqMnGG1YZYtWaVxGDeergIpO9fyyeW-dwqZ4',
  );
}