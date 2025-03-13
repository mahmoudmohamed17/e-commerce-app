import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/custom_social_button.dart';
import 'package:e_commerce_app/core/utils/custom_text_form_field.dart';
import 'package:e_commerce_app/views/auth/ui/already_have_account_widget.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  const CustomTextFormField(labelText: 'Name'),
                  const CustomTextFormField(labelText: 'Email'),
                  const CustomTextFormField(labelText: 'Password'),
                  CustomSocialButton(label: 'Signup', onTap: () {}),
                  CustomSocialButton(label: 'Signup with Google', onTap: () {}),
                  const AlreadyHaveAccountWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
