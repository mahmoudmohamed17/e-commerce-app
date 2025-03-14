import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/favorites/ui/favorites_view_widget.dart';
import 'package:e_commerce_app/views/home/ui/home_view_widget.dart';
import 'package:e_commerce_app/views/main_view/logic/main_view_cubit/main_view_cubit.dart';
import 'package:e_commerce_app/views/profile/ui/profile_view_widget.dart';
import 'package:e_commerce_app/views/store/ui/store_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String id = Routes.mainView;

  final List<Widget> _screens = const [
    HomeViewWidget(),
    StoreViewWidget(),
    FavoritesViewWidget(),
    ProfileViewWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainViewCubit(),
      child: BlocBuilder<MainViewCubit, MainViewState>(
        builder: (context, state) {
          var cubit = context.read<MainViewCubit>();
          return Scaffold(
            body: IndexedStack(index: cubit.currentIndex, children: _screens),
            bottomNavigationBar: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.00),
              child: GNav(
                selectedIndex: cubit.currentIndex,
                onTabChange: (index) => cubit.changeIndex(index),
                tabBorderRadius: 15,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 400),
                gap: 8,
                color: Colors.grey[350],
                activeColor: Colors.white,
                iconSize: 24,
                tabBackgroundColor: AppColors.kPrimaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                tabs: const [
                  GButton(icon: FontAwesomeIcons.house, text: 'Home'),
                  GButton(icon: FontAwesomeIcons.store, text: 'Store'),
                  GButton(icon: FontAwesomeIcons.solidHeart, text: 'Favorites'),
                  GButton(icon: FontAwesomeIcons.solidUser, text: 'Profile'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
