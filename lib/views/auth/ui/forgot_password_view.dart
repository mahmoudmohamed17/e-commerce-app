import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/auth/ui/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String id = Routes.forgotPasswordView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const ForgotPasswordViewBody());
  }
}
