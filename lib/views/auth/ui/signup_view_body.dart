import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/custom_social_button.dart';
import 'package:e_commerce_app/core/utils/custom_text_form_field.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/already_have_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
                      labelText: 'Name',
                      controller: nameController,
                    ),
                    CustomTextFormField(
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: passwordController,
                    ),
                    CustomSocialButton(
                      label: 'Signup',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signup(
                            emailController.text,
                            passwordController.text,
                          );
                        } else {
                          validateMode = AutovalidateMode.always;
                          context.read<AuthCubit>().update();
                        }
                      },
                    ),
                    CustomSocialButton(
                      label: 'Signup with Google',
                      onTap: () {},
                    ),
                    const AlreadyHaveAccountWidget(),
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
