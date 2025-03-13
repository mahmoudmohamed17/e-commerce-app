import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/auth/ui/forgot_password_view.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/auth/ui/signup_view.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case Routes.forgotPasswordView:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
