import 'package:e_commerce_app/core/helpers/app_routing.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoply',
      theme: ThemeData(useMaterial3: true),
      initialRoute: Routes.loginView,
      onGenerateRoute: AppRouting.onGeneratedRoute,
    );
  }
}
