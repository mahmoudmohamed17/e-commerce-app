import 'package:e_commerce_app/core/helpers/custom_loading_indicator.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:e_commerce_app/core/services/shared_prefs.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/signup_view_body.dart';
import 'package:e_commerce_app/views/main_view/ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String id = Routes.signupView;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.pushNamed(MainView.id);
          snackBar(context, 'Registered Successfuly!');
          SharedPrefs.setBool(AppConstants.isUserAuthenticated, true);
        }
        if (state is SignupFailure) {
          snackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicator(
          inAsyncCall: state is SignupLoading,
          child: const Scaffold(body: SafeArea(child: SignupViewBody())),
        );
      },
    );
  }
}
