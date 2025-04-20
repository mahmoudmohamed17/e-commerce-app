import 'package:e_commerce_app/core/helpers/custom_loading_indicato.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/login_view_body.dart';
import 'package:e_commerce_app/views/main_view/ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = Routes.loginView;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess || state is GoogleSignInSuccess) {
          context.pushNamed(MainView.id);
          snackBar(context, 'Login Successfuly!');
        }
        if (state is LoginFailure) {
          snackBar(context, state.message);
        }
        if (state is GoogleSignInFailure) {
          snackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicato(
          inAsyncCall: state is LoginLoading,
          child: const Scaffold(body: SafeArea(child: LoginViewBody())),
        );
      },
    );
  }
}
