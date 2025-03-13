import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/auth/ui/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = Routes.loginView;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: LoginViewBody()),
    );
  }
}