import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/custom_social_button.dart';
import 'package:e_commerce_app/core/utils/custom_text_form_field.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/dont_have_account.dart';
import 'package:e_commerce_app/views/main_view/ui/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: validateMode,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Text(
              'Welcome to Shoply',
              textAlign: TextAlign.center,
              style: AppTextStyles.bold24,
            ),
            const SizedBox(height: 54),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 16,
                  children: [
                    CustomTextFormField(
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: passwordController,
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed(Routes.forgotPasswordView);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.bold12.copyWith(
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    CustomSocialButton(
                      label: 'Login',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            emailController.text,
                            passwordController.text,
                          );
                        } else {
                          validateMode = AutovalidateMode.always;
                          context.read<AuthCubit>().update();
                        }
                        context.pushNamed(MainView.id);
                      },
                    ),
                    CustomSocialButton(
                      label: 'Login with Google',
                      onTap: () {},
                    ),
                    const DontHaveAccount(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
