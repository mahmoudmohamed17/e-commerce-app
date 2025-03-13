import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/auth/ui/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String id = Routes.signupView;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SignupViewBody()));
  }
}
