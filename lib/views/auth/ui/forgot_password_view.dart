import 'package:e_commerce_app/core/helpers/custom_loading_indicator.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String id = Routes.forgotPasswordView;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetSuccess) {
          context.pushNamed(Routes.loginView);
          snackBar(context, 'Password reset email sent');
        } else if (state is PasswordResetFailure) {
          snackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicator(
          inAsyncCall: state is PasswordResetLoading,
          child: Scaffold(
            appBar: AppBar(),
            body: const ForgotPasswordViewBody(),
          ),
        );
      },
    );
  }
}
