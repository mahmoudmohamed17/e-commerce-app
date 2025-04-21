import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/custom_loading_indicator.dart';
import 'package:e_commerce_app/core/helpers/custom_profile_button.dart';
import 'package:e_commerce_app/core/helpers/navigation_extension.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/helpers/snack_bar.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/auth_cubit.dart';
import 'package:e_commerce_app/views/profile/logic/profile_button_model.dart';
import 'package:e_commerce_app/views/profile/ui/edit_name_view.dart';
import 'package:e_commerce_app/views/profile/ui/my_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileViewWidget extends StatelessWidget {
  const ProfileViewWidget({super.key});

  static final List<ProfileButtonModel> _buttons = [
    ProfileButtonModel(
      label: 'Edit Name',
      icon: FontAwesomeIcons.solidUser,
      onPressed: (context) {
        context.pushNamed(EditNameView.id);
      },
    ),
    ProfileButtonModel(
      label: 'My Orders',
      icon: FontAwesomeIcons.bagShopping,
      onPressed: (context) {
        context.pushNamed(MyOrdersView.id);
      },
    ),
    ProfileButtonModel(
      label: 'Logout',
      icon: FontAwesomeIcons.rightFromBracket,
      onPressed: (context) {
        context.read<AuthCubit>().signout();
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          context.pushReplacementNamed(Routes.loginView);
          snackBar(context, 'Logout Successfully!');
        }
        if (state is SignOutFailure) {
          snackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicator(
          inAsyncCall: state is SignOutLoading,
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    const CircleAvatar(
                      backgroundColor: AppColors.kPrimaryColor,
                      radius: 35,
                      child: Icon(
                        FontAwesomeIcons.solidUser,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Mahmoud Mohamed', style: AppTextStyles.bold12),
                    const SizedBox(height: 8),
                    const Text(
                      'Flutter Developer . mahmoud@gmail.com',
                      style: AppTextStyles.medium12,
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: List.generate(_buttons.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: CustomProfileButton(model: _buttons[index]),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
