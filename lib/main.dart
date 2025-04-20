import 'package:e_commerce_app/core/helpers/app_routing.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/utils/initialize_supabase.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoply',
        theme: ThemeData(useMaterial3: true),
        initialRoute: Routes.loginView,
        onGenerateRoute: AppRouting.onGeneratedRoute,
      ),
    );
  }
}
