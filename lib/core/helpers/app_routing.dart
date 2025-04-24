import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/auth/ui/forgot_password_view.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/auth/ui/signup_view.dart';
import 'package:e_commerce_app/views/main_view/ui/main_view.dart';
import 'package:e_commerce_app/views/product_details/ui/product_details_view.dart';
import 'package:e_commerce_app/views/profile/ui/edit_name_view.dart';
import 'package:e_commerce_app/views/profile/ui/my_orders_view.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
        );
      case Routes.mainView:
        return MaterialPageRoute(builder: (context) => const MainView());
      case Routes.editNameView:
        return MaterialPageRoute(builder: (context) => const EditNameView());
      case Routes.myOrdersView:
        return MaterialPageRoute(builder: (context) => const MyOrdersView());
      case Routes.productDetailsView:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailsView(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
